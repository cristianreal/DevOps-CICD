<template>
  <div class="container">
    <div v-if="testButClicked" class="alert alert-success" role="alert">
            {{elemento}} Guardado
        </div>

        <div class="jumbotron">
            <h3 align="center" class="display-4">Crear Marca</h3>
            <hr class="my-1">
            <div class="form-group">
                <label class="col-form-label" for="namebrand">Nombre de marca</label>
                <input type="text" class="form-control" placeholder="Ingrese el nombre de la marca" v-model="namebrand" id="namebrand" name="namebrand">
            </div>

            <div class="form-group">
                <label class="col-form-label" for="country">Pais de origen</label>
                <select data-placeholder="Ingrese el pais de origen..." class="form-control" v-model="country"  id="country" name="country">
                <option value="Afrikaans">Afrikaans</option>
                <option value="Albanian">Albanian</option>
                <option value="Arabic">Arabic</option>
                <option value="Armenian">Armenian</option>
                <option value="Basque">Basque</option>
                <option value="Bengali">Bengali</option>
                <option value="Bulgarian">Bulgarian</option>
                <option value="Catalan">Catalan</option>
                <option value="Cambodian">Cambodian</option>
                <option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
                <option value="Croatian">Croatian</option>
                <option value="Czech">Czech</option>
                <option value="Danish">Danish</option>
                <option value="Dutch">Dutch</option>
                <option value="English">English</option>
                <option value="Estonian">Estonian</option>
                <option value="Fiji">Fiji</option>
                <option value="Finnish">Finnish</option>
                <option value="French">French</option>
                <option value="Georgian">Georgian</option>
                <option value="German">German</option>
                <option value="Greek">Greek</option>
                <option value="Gujarati">Gujarati</option>
                <option value="Hebrew">Hebrew</option>
                <option value="Hindi">Hindi</option>
                <option value="Hungarian">Hungarian</option>
                <option value="Icelandic">Icelandic</option>
                <option value="Indonesian">Indonesian</option>
                <option value="Irish">Irish</option>
                <option value="Italian">Italian</option>
                <option value="Japanese">Japanese</option>
                <option value="Javanese">Javanese</option>
                <option value="Korean">Korean</option>
                <option value="Latin">Latin</option>
                <option value="Latvian">Latvian</option>
                <option value="Lithuanian">Lithuanian</option>
                <option value="Macedonian">Macedonian</option>
                <option value="Malay">Malay</option>
                <option value="Malayalam">Malayalam</option>
                <option value="Maltese">Maltese</option>
                <option value="Maori">Maori</option>
                <option value="Marathi">Marathi</option>
                <option value="Mongolian">Mongolian</option>
                <option value="Nepali">Nepali</option>
                <option value="Norwegian">Norwegian</option>
                <option value="Persian">Persian</option>
                <option value="Polish">Polish</option>
                <option value="Portuguese">Portuguese</option>
                <option value="Punjabi">Punjabi</option>
                <option value="Quechua">Quechua</option>
                <option value="Romanian">Romanian</option>
                <option value="Russian">Russian</option>
                <option value="Samoan">Samoan</option>
                <option value="Serbian">Serbian</option>
                <option value="Slovak">Slovak</option>
                <option value="Slovenian">Slovenian</option>
                <option value="Spanish">Spanish</option>
                <option value="Swahili">Swahili</option>
                <option value="Swedish ">Swedish </option>
                <option value="Tamil">Tamil</option>
                <option value="Tatar">Tatar</option>
                <option value="Telugu">Telugu</option>
                <option value="Thai">Thai</option>
                <option value="Tibetan">Tibetan</option>
                <option value="Tonga">Tonga</option>
                <option value="Turkish">Turkish</option>
                <option value="Ukrainian">Ukrainian</option>
                <option value="Urdu">Urdu</option>
                <option value="Uzbek">Uzbek</option>
                <option value="Vietnamese">Vietnamese</option>
                <option value="Welsh">Welsh</option>
                <option value="Xhosa">Xhosa</option>
              </select>
            </div>

            <div class="form-group">
                <label class="col-form-label" for="webpage">Pagina web</label>
                <input type="text" class="form-control" placeholder="Ingrese la pagina oficial de la marca" v-model="webpage"  id="webpage" name="webpage">
            </div>

            <button v-on:click="createPost">Post!</button>
</div>   
  </div>
</template>
<script>
import axios from 'axios';
const _IP="34.69.42.189";
const _PORT="5000";
const _PATH = "/api/marcas/";
const url = "http://"+ _IP + ":" + _PORT + _PATH

export default {
  name: 'crear',
  data() {
    return {
      error: '',
      text: '',
      elemento: '',
      testButClicked: false
    }
  },
  methods: {
      testToast() {
      this.testButClicked = true;
    },
    createPost(){
     this.elemento = this.namebrand
      axios.post(url, { name: this.namebrand,country: this.country, webpage: this.webpage}).then(() => {
        this.namebrand = ''
        this.getPosts()
      }).catch( (error) => {
        console.error(error)
        return;
      })
      this.testToast()
    }
},
     watch:{
    testButClicked(val){
      if (val){
        setTimeout(()=>this.testButClicked=false,1000);
      }
    }
  }
};

</script>