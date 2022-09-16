const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/productsapi');

const productSchema = new Schema({
  product_id: {type: Number, unique: true},
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: String
});

const ProductDB = mongoose.model('ProductDB', productSchema);