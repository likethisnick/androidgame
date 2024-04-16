extends Timer

var countdown = 0
var easyCampaignDone = false

func _ready():
	pass

func _process(delta):
	print(self.is_stopped())
	if countdown>0:
		countdown -= delta*2
	elif !self.is_stopped() && countdown<=0:
		easyCampaignDone = true
		self.stop()

func addCountdown(seconds):
	countdown += seconds
	self.start()
	
func getCountdown():
	return countdown
