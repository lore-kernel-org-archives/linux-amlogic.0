Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AEAC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Dec 2022 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlh0X/CLT3lbPgouxfw9Tz+IPWNTDv4h7rGsQ1/HyOs=; b=4VS6b3orx1GWbF
	HJ9hXV8uzxRn+qQSwVmF1TUzS6oLhKbAKRcI18eXIyWxzOtWOMatwfwkehTjx998MB8PHltZltwhE
	tSSP+36F4dTQbm8lx64PeVo+dJ4LcvYnC1fV6CKLvvYFrAnSGn3ZpI05O+Vo5FwubU1W2P2qa+zBx
	IuXMkCYA8rZEO/YfDaibrae1zdQ4+UI4guMuPI099i74G7L92KjuFlInChBC7xrdYezQ48ZLK02qI
	Hu6rq8u/E9iwXxITOQ9epdreLEdY2pTzFVFlMxSTTn8y4oUPfzf2GPo5zfMiXPZJ8tfcddgD2fe2y
	Cuqv/WalCVNbZTUNV9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iMz-00Fygk-6H; Mon, 12 Dec 2022 12:57:21 +0000
Received: from mail-tycjpn01olkn2068.outbound.protection.outlook.com ([40.92.99.68] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iMw-00Fyay-ER
	for linux-amlogic@lists.infradead.org; Mon, 12 Dec 2022 12:57:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWUIFX8MV+S4VP4OjwNUEAozSsvkP485E+tPZ3FopmWAhDUnT6vfA+x98lVp90hoZIyUuNKRLZdtCeEtd4UcevJxdzsQH8n26ucQtJhGh3pFYhPZNjYoDWpHrKX/96MiOXiF3J52crOoaKHo94GwWzyIo1pebUDFjod65JQirQGUXFGKpKzlz5n6UFuCKOKt9fpkCup597dmwVJy5quk528k+azbm9nQGj0HN2pIPO9XB8TfXzqd8z8eHWMnejsLKK/OCzyDLOf1RGn8OYzXxm0FgrK+NN4rLt8PgGe4FAAFvMRsKmqPW1A1nvYzDfEZjswAPtxA/b3VR//qFuodZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6mtxdDOPQdw4Es2OprF/R+uGRJzzWOq+b9/vDJW4tg=;
 b=bfBGKagkf6DI2hVwnM0rCidMySM7U7kX6JVVxfK1UUR/MrlHyTnxN6h7G5CTmiyk8HpygcW47/lNQThprt+Obmwz7GF2gD2d5XlcBPaFJo01nyLXzeapBmGa8fx6g2dbU4gfzsY1/s+qwzcRNUx4yBNNgtQdgD16QU7ScdcmwM3gNmnjkCsDBEK5S5CnhtWIrP6emJNHRmdr0G13q5DKi+fi3hdnFksBIVtr6rzgO5+12DdRrp97Yxc4pQCgZoF0o6z7AE3XP285ZFLjtR5gfUDOwm5UKPjgDvZc+u8ASYHJJ4T411UiFErijJffmWCEZfN5wccpXv/0533DfMT3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6mtxdDOPQdw4Es2OprF/R+uGRJzzWOq+b9/vDJW4tg=;
 b=nMAyw3m5PQvRxi+9nRk460W9nV/Z2BTUdAvxxLhzEfHjBndIvr8vvQfMQ21XZAFl1i4/92QEqA7zhCwYFVI4S8OkQPARdqCUZ3IN5xZRwzSYEuxlq5kooa5yM0FwjiR6lZupTxLoyOfkafpS8U+ekait9bIo8dk7gSBa2hZ4sIm7NJbBSG7iVzQA8VbEpdZo3/J7WHZQdzkKe8xI0ueraQIeqs95n8R/OSV7B4W06Zy68r+3gRGVUE/z9kRP+iJP21kHYG7oh+oSebAoo/MSrZc6n6zuQwG7IyKYHacvGuJRdETovZoBxalDJleR5ivYC5k+d61RWE+wcnglWK7s+Q==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OS3P286MB2075.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:192::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 12:57:07 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 12:57:07 +0000
Date: Mon, 12 Dec 2022 20:57:02 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB06413425DA9936EC32D100ABCDE29@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <33E05D5D-E8C8-4493-B269-E3020D98740C@gmail.com>
Content-Disposition: inline
In-Reply-To: <33E05D5D-E8C8-4493-B269-E3020D98740C@gmail.com>
X-TMN: [31Ej4zb4Juh9+bXZwcXTU94kV9rcZxa0m0conXdj6HIV0A1Cojhd9hyBGrcMqJkh]
X-ClientProxiedBy: SG2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:3:17::29) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y5clHlH8vhvXSW49@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OS3P286MB2075:EE_
X-MS-Office365-Filtering-Correlation-Id: c82e2db7-5b04-4ddc-ff08-08dadc40601b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	b2F6TJfy2+q4iLtW4ewj4pVSV1YpG47V3PjJOr75czwi29HYJ0IFjifftfb6psWOupZ1/i3BqkRwlZ+BmLqUUc/mNdVI6yj7P3CHrRu1Zu4eGADcRWs0z2MSImMXr3RUb8WSyIHWz5iRqWzycrd4+RTKk9Qh0e16GV89PMugdm5/qBP4Gih1z2Ix1B/iI8jihJ1J0m+tIjX//q9O/7UgwFQgcPNLEM28obL1F17zprn2ppqd7q/ELU3RKFw/UNyqpOx7An0BaCGrD9tBIfAsy+qOaQWKWWpU74ylfRnVhWs0Mg2bYQTWntE9jSkXjGNXzOIFJNzaghBpURD95rn7TxS6xotppyR6hofktXBy9yNEp9chqBscVvoVtRG8AMQhiPhFQhvYehzJl9ScjmEn/WzZJvV4KExezCiYnLIEQyTxvXDpl1LA0bf2HgisgURNhjLnXYATsN1quAo3NX3TdqM5GtQdtWY/iLExjddYr6e0y5+zls+nPxmT3hq3tJJYyinMDpPkbarJ5A2FgRGdjycDZwSVIBhbSh6QsBt6VmoutE0C0zPAXL/jGs7DHm1tOyf0KULNTTTxhSFxb5wOeriljPaShy+o6W6z8QG6V2mMci9NGftSjumbfBYV/zdH8+P8UFB1YaUtFggf+v/mx2VOBubm/7rdcAQe5Ehxr3c=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OCtyY3prRE0wSkVYc3BsTlh4eThjc3JnUHZCbUo3Z2FJSEQybTcyc3RsdEpU?=
 =?utf-8?B?WlhEc1ZBTnRzcVJLQWlDck01YmdBZ0ZWbEQ4MDJSSVhodVRHSHpBNFJjaHpR?=
 =?utf-8?B?NnFyUDJhaVhPRWt4NG1iVFNLMDZSN212MFFvRFB1Vk9rS3RRTDIySXFOYlc0?=
 =?utf-8?B?a3pIeWtZM1NYdW82WWQ3MjNSb0h6aklrL0hPV2JGL1JjTnEvek8zajd1Wk1J?=
 =?utf-8?B?bmNHSTl5ZVpRdk1hUEthYXpxUHBubk1UakFORWR0QXdyc1dIUVFLMUUwQlJB?=
 =?utf-8?B?SVo2MkttSVR6dEM0Qit5Yk53dzFYZDkrM0Jna1paU2E3SVhDamV4ZVN4clRP?=
 =?utf-8?B?cjl1cGFRUTIxbzBDcDhzREV2M2V1Wi8wTitsVUt2cTZwWGRUZ3VUdlYwcVRQ?=
 =?utf-8?B?U2hKazBFSTdQakFNaHNxUFRVMnZleUxXL1dKeFJxaE4yQTFWY0xDdll3YTlq?=
 =?utf-8?B?YlRjUDBydVJkT2Fqb3Nhd1crNHJTYnNxbExxV3JUNlh0L2Y3ZGVnZU1CTkVs?=
 =?utf-8?B?d1FCMDFJVnQ5Umh0U2JLUmY3YTcrc1c3cVcyQjNyMGl2aVlMRkpSL0RnYkRZ?=
 =?utf-8?B?bFdvSERRWXYydzlZaTVINVdhSlU1SW4rY21ZcWt2dDBwckFHWm9QS3dUOEU2?=
 =?utf-8?B?Zm5BakNCRUtLRkJWNGhGTnMvN0RhRkFKOFdmbzd4UUszZmcrclJwd3g4cUlH?=
 =?utf-8?B?TzBlclR6a1lXdVBraG1nVHZXc2pyMzYzajgrTXZYdWEvdDd5TlNNakpBWUFC?=
 =?utf-8?B?NEFZZnBTNy83UDMvcVdSbW9UODdSQ0FHa2xGblh1MXdLa3kwc1lIOW9rUEp4?=
 =?utf-8?B?Y1ZBQkk0S0luVncwUi9HREY0NEFvNVhCL2VseS9mRkdKdFRjSWd0azBwa2ZZ?=
 =?utf-8?B?eVIxSWNBbnYvUnJiQUpURWY3MTc5QUVkNEhpZGxsNHdKTWFyOEJrbDZVTjZ0?=
 =?utf-8?B?ZkVsME4rM0RrL1BwREF6bFNpRFlYYTZXRjRPODRVMlU0dTNGc1BIdUZNUEUr?=
 =?utf-8?B?MGJqb3BPeVBucEQ3Q1Q1M1FrazhRVE9qalZjejlHdXRybEdjNHR1NU5SZFdq?=
 =?utf-8?B?b09lcDdpUWRrVmF5aHRYU1g3ZVJIQjVZTzNDZEl1ZkV3S2xIWkNlb0tXUFl1?=
 =?utf-8?B?RFNVTnE4dE5NWFVRVmYrUkxROGtrVjdwa25kYVdmVW5oTUc4YjVFTkpSVjZo?=
 =?utf-8?B?RWdqSmhkdGxPSlhPYTE0WUpaUS9Kb21PdnhlKzVscW9RY1ZMWmF6RytlR0Qv?=
 =?utf-8?B?NEJ6WTdKZE0vTG5Fd3l5YXJva3Fqc1E5TVU2VlQ4eFB4L1QyWnYzSmlya0tQ?=
 =?utf-8?B?Q0FUbHdLS216NjA3VTNwa2dYWU8yQlZOYkNTTnlCRHRmRHBVOGV5KzVaSk5k?=
 =?utf-8?B?UkxSZExSNmpTNktSNS96bldDUlZ0M3J5VTBlbHphVEZ6ekFRMUQwdVhiUnBs?=
 =?utf-8?B?KzFTbUxQK21xMkFnczhHckpkYTVDaGUyUVF1cmx5emJ0aWhKcHJDdVZNc2lU?=
 =?utf-8?B?RUt0ekdseThJZVlsMGdBbjlvb0tGUWZHSWM1ZVJBRGtBaVFSZE84VE9LU3pw?=
 =?utf-8?B?N3hMWmxiTUN5di80L2YwQ3lmUWhjaWRvdEc5SzBLZ2ROR1haTUlINjhPS3pW?=
 =?utf-8?B?ZDJIdmZzK3h0dWNhM2JlMWtMSWNwVXhQdWI1NVllQS81elpLRUtmT0xNTWl6?=
 =?utf-8?B?dE4rbGFCNlAwVEQ1cUd3R1pkdDVYdDJZTkhwN0k3OUxQNCthYk5peWoyUDVQ?=
 =?utf-8?B?V25uOEtWOEt3VHZPYWI0RFk0SVBwdjlFR3hUc1FZWWNVclF0ZnpVNUgyWUNZ?=
 =?utf-8?B?K3dTVGUwUk5BYW1XRWFQZz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82e2db7-5b04-4ddc-ff08-08dadc40601b
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 12:57:07.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_045718_557461_37791647 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBEZWMgMDksIDIwMjIgYXQgMDI6NTc6NDBQTSArMDQwMCwgQ2hyaXN0aWFuIEhld2l0
dCB3cm90ZToKPiBbc25pcF0KPiAKPiBIZWxsbyBaaGFuZywKPiAKPiBJ4oCZdmUgdGVzdC1ib290
ZWQgYSBWSU0xIHVzaW5nIG15IGN1cnJlbnQgYW1sb2dpYy02LjEueSBicmFuY2ggKGJhc2VkIG9u
IHJjOCkgYW5kIEkgZG9u4oCZdCBzZWUgYW4gaXNzdWUgd2l0aCBXaUZpOgo+IAo+IGh0dHA6Ly9p
eC5pby80aTdNCj4gCj4gSGVyZeKAmXMgdGhlIGtlcm5lbCBzb3VyY2UgYW5kIGRlZmNvbmZpZzoK
PiAKPiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9saW51eC9jb21taXRzL2FtbG9naWMtNi4x
LnkKPiBodHRwczovL2dpdGh1Yi5jb20vY2hld2l0dC9MaWJyZUVMRUMudHYvYmxvYi9hbWxvZ2lj
L3Byb2plY3RzL0FtbG9naWMvbGludXgvbGludXguYWFyY2g2NC5jb25mCgpJIG5hdGl2ZSBidWls
ZCBrZXJuZWwgZnJvbSBkZWJpYW4ncyBrZXJuZWwgcmVwbzogaHR0cHM6Ly9zYWxzYS5kZWJpYW4u
b3JnL2tlcm5lbC10ZWFtL2xpbnV4Lwp3aXRoIHNvbWUgQW1sb2dpYyBwYXRjaGVzOiBodHRwczov
L3NhbHNhLmRlYmlhbi5vcmcvemhhbmduMTk4NS9saW51eC8tL3RyZWUvbWFzdGVyL2RlYmlhbi9w
YXRjaGVzL2ZlYXR1cmVzL2FybTY0L21lc29uCmFsbCBmb2xsb3cgZGViaWFuJ3Mga2VybmVsIGNv
bmZpZy4KCj4gCj4gSW4gdGhlIExFIGltYWdlIEkgaGF2ZSB3bGFuMCBhbmQgY29ubm1hbiBpcyBs
aXN0aW5nIHNlcnZpY2VzOgo+IAo+IFZJTTE6fiAjIGlmY29uZmlnCj4gZXRoMCAgICAgIExpbmsg
ZW5jYXA6RXRoZXJuZXQgIEhXYWRkciAxNjpBNzo3OTo5MzpCRTpFQiAgCj4gICAgICAgICAgaW5l
dCBhZGRyOjE5Mi4xNjguMjAuMTIgIEJjYXN0OjE5Mi4xNjguMjAuMjU1ICBNYXNrOjI1NS4yNTUu
MjU1LjAKPiAgICAgICAgICBVUCBCUk9BRENBU1QgUlVOTklORyBNVUxUSUNBU1QgIE1UVToxNTAw
ICBNZXRyaWM6MQo+ICAgICAgICAgIFJYIHBhY2tldHM6MTAzNiBlcnJvcnM6MCBkcm9wcGVkOjAg
b3ZlcnJ1bnM6MCBmcmFtZTowCj4gICAgICAgICAgVFggcGFja2V0czozMDggZXJyb3JzOjAgZHJv
cHBlZDowIG92ZXJydW5zOjAgY2FycmllcjowCj4gICAgICAgICAgY29sbGlzaW9uczowIHR4cXVl
dWVsZW46MTAwMCAKPiAgICAgICAgICBSWCBieXRlczoyNTI0NzMgKDI0Ni41IEtpQikgIFRYIGJ5
dGVzOjEzNDE4OSAoMTMxLjAgS2lCKQo+ICAgICAgICAgIEludGVycnVwdDozMiAKPiAuLi4KPiAK
PiB3bGFuMCAgICAgTGluayBlbmNhcDpFdGhlcm5ldCAgSFdhZGRyIENDOkI4OkE4OkI1OjlGOjg2
ICAKPiAgICAgICAgICBVUCBCUk9BRENBU1QgTVVMVElDQVNUICBNVFU6MTUwMCAgTWV0cmljOjEK
PiAgICAgICAgICBSWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5zOjAgZnJh
bWU6MAo+ICAgICAgICAgIFRYIHBhY2tldHM6MCBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6
MCBjYXJyaWVyOjAKPiAgICAgICAgICBjb2xsaXNpb25zOjAgdHhxdWV1ZWxlbjoxMDAwIAo+ICAg
ICAgICAgIFJYIGJ5dGVzOjAgKDAuMCBCKSAgVFggYnl0ZXM6MCAoMC4wIEIpCgpJJ20gaGFwcHkg
dG8gc2VlIFdJRkkgd29ya3MuCgpXSUZJIG9uIG15IFZJTTEsIGl0IGNhbiBjb25uZWN0IHRvIEFQ
IGFuZCBnZXQgSVAgYWRkcmVzcy4KYnV0IGFmdGVyIGEgd2hpbGUsIDFzZWN+NW1pbiwgc3NoIHRo
cnUgd2lmaSBpcyBzdHVja2VkLCB0aW1lb3V0IGxvZ3MKcHJpbnQgdG8gdWFydCBjb25zb2xlLgoK
Y291bGQgeW91IHRyeSB0byBjb25uZWN0IHRvIEFQIGFuZCB1c2Ugd2lmaT8KCj4gCj4gVklNMTp+
ICMgY29ubm1hbmN0bCBzZXJ2aWNlcwo+ICpBTyBXaXJlZCAgICAgICAgICAgICAgICBldGhlcm5l
dF8xNmE3Nzk5M2JlZWJfY2FibGUKPiAqQSAgQ0lSQ09MT0NPICAgICAgICAgICAgd2lmaV9jY2I4
YThiNTlmODZfNDM0OTUyNDM0ZjRjNGY0MzRmX21hbmFnZWRfcHNrCj4gCj4gSeKAmXZlIHB1c2hl
ZCBhbiB1cGRhdGVkIFZJTTEgaW1hZ2Ugd2l0aCB0aGF0IGtlcm5lbCBoZXJlOgo+IAo+IGh0dHBz
Oi8vY2hld2l0dC5saWJyZWVsZWMudHYvdGVzdGluZy9MaWJyZUVMRUMtQU1MR1guYXJtLTEwLjg1
LjAta2hhZGFzLXZpbS5pbWcuZ3oKPiAKPiBUaGVyZSBhcmUgYSBjb3VwbGUgb2YgcGF0Y2hlcyB0
aGF0IHR3ZWFrIFNESU8gc3BlZWRzIGluIG15IHRyZWUsIGJ1dCBub25lIG9mIHRoZW0gYXJlIG5l
dy4KPiAKPiBBcyBpdCBsb29rcyBsaWtlIHlvdSBoYXZlIHNvbWUgb2YgbXkgcGF0Y2hlcyBhbHJl
YWR5OyBwZXJoYXBzIGJpc2VjdCBteSBmdWxsIHBhdGNoc2V0IGFnYWluc3QgZGVmYXVsdCA2LjEt
cmM4IHRvIHNlZSBpZiB0aGVyZeKAmXMgYSDigJhmaXhpbmfigJkgY2hhbmdlPwo+IAo+IENocmlz
dGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
