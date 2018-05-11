using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AssignmentAPIData;
using AssignmentAPIData.Repository;
using AssingmentAPIEntities;

namespace AssignmentAPI.Controllers
{
    public class ContactController : ApiController
    {
        private IContactRepository _objContactRepository;

        public ContactController(IContactRepository contactService)
        {
            _objContactRepository = contactService;
        }
                
        // GET api/contact
        [HttpGet]
        public IHttpActionResult Get()
        {
            var contactList = _objContactRepository.GetAll();
            if (contactList != null)
                return Ok(contactList);
            return NotFound();
        }

        // GET api/contact/5
        [HttpGet]
        public IHttpActionResult Get(int id)
        {
            var contact = (Contact)_objContactRepository.FindBy(x => x.ContactId == id).FirstOrDefault();
            if (contact != null)
                return Ok(contact);
            return NotFound();
        }

        [HttpPost]
        public IHttpActionResult Post([FromBody]ContactModel contact)
        {
            if (ModelState.IsValid)
            {
                ContactModel result = ConvertEntityToVM((Contact)_objContactRepository.Add(ConvertVMToEntity(contact)));
                if (result != null && result.ContactId > 0)
                    return Ok(result.ContactId);
                return InternalServerError(new Exception("Contact not created!"));
            }
            return BadRequest(ModelState);
        }


        private Contact ConvertVMToEntity(ContactModel contactVM)
        {
            return new Contact() { 
                                ContactId = contactVM.ContactId,
                                FirstName = contactVM.FirstName,
                                LastName = contactVM.LastName,
                                Email = contactVM.Email,
                                 PhoneNumber = contactVM.PhoneNumber,
                                 Status = contactVM.Status
                            };                      
        }

        private ContactModel ConvertEntityToVM(Contact contactEntity)
        {
            return new ContactModel()
            {
                ContactId = contactEntity.ContactId,
                FirstName = contactEntity.FirstName,
                LastName = contactEntity.LastName,
                Email = contactEntity.Email,
                PhoneNumber = contactEntity.PhoneNumber,
                Status = contactEntity.Status
            };
        }



        // PUT api/contact/5
        public IHttpActionResult Put([FromBody]ContactModel contact)
        {
            if (ModelState.IsValid)
            {                
                _objContactRepository.Edit(ConvertVMToEntity(contact));
                return Ok(contact);
            }
            return BadRequest(ModelState);
        }

        // DELETE api/contact/5
        public IHttpActionResult Delete(int id)
        {
            if (id > 0)
            {
                Contact contact = (Contact)_objContactRepository.FindBy(x => x.ContactId == id).FirstOrDefault();
                if (contact != null)
                {
                    _objContactRepository.Delete(contact);
                    return Ok(true);
                }
                return NotFound();
            }
            return BadRequest("ID should be greater than 0.");
        }
    }
}
