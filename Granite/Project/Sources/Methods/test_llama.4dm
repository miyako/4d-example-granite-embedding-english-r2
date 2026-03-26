//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$batch:=$AIClient.embeddings.create(\
["Achy Breaky Heart is a country song written by Don Von Tress. Originally titled Don't Tell My Heart and performed by The Marcy Brothers in 1991. "; \
"Who made the song My achy breaky heart?"])

$fr:=$batch.embeddings[0].embedding
$en:=$batch.embeddings[1].embedding

$cosineSimilarity:=$fr.cosineSimilarity($en)
//0.7556266769817

ALERT:C41([$cosineSimilarity].join())