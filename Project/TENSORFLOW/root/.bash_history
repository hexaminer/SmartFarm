ls
cd /
ls
mv malaysia/ training_data
ls
python tensorflow/tensorflow/examples/image_retraining/retrain.py --bottleneck_dir=/bottlenecks --model_dir=/inception --how_many_training_steps 2000 --output_labels=/retrained_labels.txt --output_graph=/retrained_graph.pbtxt --image_dir=/training_data/
ls
cat test/
cd test
ls
cd ..
ls
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/test/girl1.jpg
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/test/girl2.jpg
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/test/girl3.jpg
cd test/
ls
cd ..
ls
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/test/man1.jpg
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/test/man2.jpg
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/hijab1.jpg
python tensorflow/tensorflow/examples/image_retraining/label_image.py --graph=/retrained_graph.pbtxt --labels=/retrained_labels.txt --image=/hijab2.jpg
exit
ls
cd /
ls
mkdir macgyver
cd macgyver/
ls
mkdir temp
vim main
apt-get update
apt-get install vim
ls
vim main
cat main 
ls
exit
ls
cd /macgyver/
ls
vim main
ls
cat main
mkdir images
l
ls
cd temp/
ls
vim data.json
vim data.json 
ls
cd ..
ls
vim main 
python main
cd ..
ls
mv retrained_graph.pbtxt retrained_graph.pb
ls
cd macgyver/
ls
python main
vim main 
python main
ls
cd temp/
ls
cat data.json 
vim data.json 
cd ..
python main
cd ..
ls
cat retrained_labels.txt 
ls
cd macgyver/
ls
vim main
python main
vim main
python main
vim main
python main
vim main 
python main
vim main 
python main
vim main 
python main
vim main 
python main
vim main 
python main
vim main 
python main
cat main 
vim main 
ls
cd temp/
ls
vim data.json 
js-beautify -o data.json 
cat data.json 
cd ..
ls
python main
vim README.md
main python
python main
cd ..
ls
cd training_data/
ls
cd ..
vim retrained_labels.txt 
cd macgyver/
ls
python main
cd ..
exit
ls
cd /
ls
rm hijab1.jpg 
rm hijab2.jpg 
rm retrained_graph.pb 
rm retrained_labels.txt 
cd training_data/
ls
rm -rf men/
rm -rf women/
ls
cd ..
ls
cd macgyver/
ls
cd images
ls
rm temp.jpg 
cd ..
ls
cd temp/
ls
cat data.json 
cd ..
ls
vim main 
ls
exit
ls
cd /
ls
cd training_
cd training_data/
ls
exit
ls
cd /
ls
vim training_commands_examples.txt
ls
exit
ls
cd /
ls
cat training_commands_examples.txt 
cd training_data/
ls
cd ..
ls
cd training_images/
ls
cd ..
rm -rf training_data/
exit
ls
cd /
ls
cat training_
mv training_commands_examples.txt trainingCommands.txt
vim trainingCommands.txt 
exit
ls
cd /
ls
cd macgyver/
ls
vim main 
cd ..
ls
cd macgyver/
ls
cd temp/
ls
cat data.json 
cd ..
vim main 
python main
cd ..
ls
cd training
cd training_images/
ls
cd ..
ls
python tensorflow/tensorflow/examples/image_retraining/retrain.py --bottleneck_dir=/bottlenecks --model_dir=/inception --output_labels=/retrained_labels.txt --output_graph=/retrained_graph.pb --image_dir=/training_images/
ls
cd macgyver/
ls
cd temp/
ls
vim data.json 
cd ..
ls
python main
exit
ls
cd .
ls
cd /
ls
mv trainingCommands.txt commands.txt
ls
cat commands.txt 
cd macgyver/
ls
vim main 
ls
cd ..
ls
cd training_images/
ls
cd ..
ls
rm dalmation.png 
ls
cd tensorflow/
ls
cd ..
ls
exit
