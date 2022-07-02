Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED0C28B2C
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap8xF2mwmVjhDjUc9NsOt4601mdjRaclvAszQt6DmoU=; b=HzijnI2Vkg2v5B
	bFlxTL5nkrp/zonu/P33Ghcf4uissWzo2JpxLeAdJ4Qc8IwPFIW2NMkt6EITaIdYntYSHIr+oy2UP
	7hjm2lh6/5fCRsDvAnPu2hX4IBFTTKTr6ZdunUfXSsJtLZIdRIt8kJekylAxn5Y2w/2zhMWBEhTb1
	y1AGO2ydbB4zHIhqVN9KOKtIkvMF+t6xvzNNRP23wVBpU9UMmg4Jn5NV92kX6NfzvsN9MjobLsesO
	Y0TdZaPI7KzUJzaleFiVyjJUWC1lpAmwXH3jgZ+mEx3d+ZkL8lykzJCyVak7tVAdncJ/n2PmpJPp4
	z3f5dDkW2e8XoCVsnCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMQdA-003SQ9-2V; Fri, 12 Aug 2022 09:07:00 +0000
Received: from mail-tycjpn01olkn2081.outbound.protection.outlook.com ([40.92.99.81] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Xmi-008USm-Nj
	for linux-amlogic@lists.infradead.org; Sat, 02 Jul 2022 07:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3HUJYv5c8ANtdY58PV62AoGK+ay7/KLiisOKTO2wBxL/+WCGyPOm4He/sUfPIF9+etLzUugm+n3i7kNSkn0CRsLlEQ2BukLIW0Sf2SRcBS0w25+P/sfSbpOPyM+iIdvsTvQi39uZ4ERJI+kDwRsoij8HhnGko5fMs1DhxODDPDFqWQ9OHsNasEF795KNuI0PIUuTon8sVQ3N24zhC5VRnUty5A1Up1zXEoRUvMOIMCuShl3p0eUEmChHbmChbfxSklR/8aoxXyD2A9BX2gaHwrX4PTarenzmwO50+laH+I6F5ZXOoi/tHrpmUlXMlVWzWZraFEDZJRKP7d1vQfARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U7BqK0ZW8Wsexn9SJOzIBbUvjO2mtGp3ATOdu8Elx8=;
 b=FkiFp3mPS5qGgw5JWFHmtO12MHSp71S8MZCSFTLUVQCtSkL6GaWtyu7gVxvz7fnVXMyomMSouXIc6ZjVO/IxL21FiTAWeujrx+4WLF5tDCTCaN48qUYllAf9c14C6tzxEFqGcX2sr/yBJJuyfzAJhTxwEFMEDJeZULMbBnriglAIckTpb/9saYpIED3lYr8YJWbl4QbUb52bG0gob3Mu4kH7aF2GLmPcB59MlXOAjvWo7s9AY2atc/471SNVFpBK1TTeomIA/V6Y/8lwUVKEaqU7g2YVX0TgeBxKBEbeDimYVa5JonulHKnvRrW9uaPv5HEuyDDUrZ+ptpDHoyr+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U7BqK0ZW8Wsexn9SJOzIBbUvjO2mtGp3ATOdu8Elx8=;
 b=BpeCNHmHoGJx4RCTXFDtbkDKkXg/g4kutStQF+1iIF86c/oFhE/+9sL8CXaoxlWf7iu9t0T0O+CuBZoxa+u3LHNqqljvXVQ5O0JJwiyRPgiWoR4tFDTlR5p8DoMfkDUebS8UrpsGUEZWSBEuvKVi6EfrcJALqwmsi7OG2KLErdl2rdeRgc7e1N47Xce1e1MbHJZX/sjGNhXUOaMyrPr4rc+6ol8935kipECGBat4EZhSlDSW4DPC18dIxks30GjPnliLwwK1ooBRYHwqkXSG343TfZsrP06pP0WpIf5blMnuAeAhCxe78G5W6af8+zoUqvCRIJ1C5phf3d/K9G0fxQ==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OS3P286MB0631.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Sat, 2 Jul
 2022 07:43:12 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c%9]) with mapi id 15.20.5395.018; Sat, 2 Jul 2022
 07:43:12 +0000
From: =?utf-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>
To: Neil Armstrong <narmstrong.kernel@gmail.com>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, Nick
	<nick@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: =?utf-8?B?5Zue5aSNOiBIb3cgdG8gdGVzdCBtZXNvbl9neF9wbQ==?=
Thread-Topic: How to test meson_gx_pm
Thread-Index: AQHYigGRzKmehYfgSk2cJU0i2Jxf9q1i/4aAgAA+TtqAB3zEoQ==
Date: Sat, 2 Jul 2022 07:43:12 +0000
Message-ID:  <OS0P286MB06413410F7816FEC2DC1D820CDBC9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References:  <OS0P286MB06419BC49795C5CC383B8D75CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <b2c13330-8c03-a08b-19d5-10afc8b28c2c@gmail.com>
 <OS0P286MB06413EEDA8411EA36A33DE16CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To:  <OS0P286MB06413EEDA8411EA36A33DE16CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [iddogDXT1vLl5eWpp8n5koozPPM2V858]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca0ccfc8-07de-4821-c13f-08da5bfe8448
x-ms-traffictypediagnostic: OS3P286MB0631:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EG383N/hUYj2nHJJmZ4lM+mVH0QJeUE5vkzg0nStfDuwKlTz/HV2ziZm9j4OHyQO4ZkAzaUtaKeMqBmxs+Ufc0eGnLWlWivrNQ8VVRC8NP5RCM/pwzDmnWN7tnSnpIav0skg+w2cCOX7H22bDXmCVlcxPpTciE3Hh4jPFgM4rrkdkWJ7tPJp3L1i0qe3SJVDtWNU5xWeQGLaRerA4HIwU00cYqAvQutJ2ReVdHNmFt4zFixDgt/jEPVoAPL1i7wphd3OPo9vpgMWTIcI0N2YtvSCKhQKJ+xgq8tK7D3aThE9OXV+qQ/kIqPRXcSsTcc/t88IodEyj7MeSJVacqQeT61XCQSgANuOEi95TzLK8HKU1SANhA18IHovKjdn15Nc1yaH3hktZ316G4fe2qbTdgY5Mr/Gyf38gab9rZXVuooeVqtCImfkl0D8+0jh3R/OCUTwynekH2EVWBANbplJ0wniBA/nsys9WiScciA88h6FNqHb9sn4VYGZxkaN934VDYh63VdhJM2H8TF0IMwZdKChnNcJole0F0VhuCh9zHPDpXk+qnLUzRSEe/JK0Z7oQnU8ukfONfCxIPqNB70T8Abyb33Nskl84Pdyzd0exLqbCdPItkHPiq28F6HipyeCSdD/La8NZlY7/MGx6VzKx+G6pTnJsP5zbe5KCsNO/lo=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NlhHYUkrQ0thTzhyNVR6djRiYUtRMW53Qk1QOTlFMFp4NUdrVG5JdU1UUWVi?=
 =?utf-8?B?bmFRdnMvL214bDNibVZOSFFOQ3VkMUQzSURYTjhENDRBa0RSdk1pTTBodWJI?=
 =?utf-8?B?UGZRbm44akhFWWVJMGVVMDRQMHZjUXJqbGF3YWR0clVtQUgzY2U3a2tUWUE5?=
 =?utf-8?B?OGVQUGw2dm9OcGZoZGcxY1VTTGxiVUIxNDRoNGJVS0x2Q29rR1YyMGJBQ2hH?=
 =?utf-8?B?WVowNUZFTXpHNFBORVM4bU9aa05pSThkV2xUS2ZHWngyWUFFUUg4RU9nZm5I?=
 =?utf-8?B?WXJQM0RvRytGUFZla1krdXJRUC9KanE4T3oyQk1VcHliZjFBR1NZSzVXNldI?=
 =?utf-8?B?R1NIWk1mUU1iZC91dTRXMzI2OTR6M0YyQXozMHFXL0w5WW03MnR4citGT3I4?=
 =?utf-8?B?Q2Uyb2FBRzBaaTJFWDAwZ0lMOWNWbCtlRC9mU2prNk5IeTFYWmlORFBFbndL?=
 =?utf-8?B?V3h3SHVzMWlRYUN1QzN4QkFkSDZ6Y25KK05nQ3RsUWE3a3l5UytuUy83emZT?=
 =?utf-8?B?Z2NIZUdmTGFMQnlDVGN4Y3JnMGpTLzNOZjZVcGNIYlFkOEJOQVNveWUxNThY?=
 =?utf-8?B?eEZRR3VkclkreHBaY3Jab2FjTE5IUEo4TDVWelY3U0tiL1NUNDh6djhHb0sz?=
 =?utf-8?B?V3VoOXNOY3UzSEp6dkwrMjQyL25nNkFHdENpUFpHS1dnb29WRkk5OGU4YXNN?=
 =?utf-8?B?VlJsRFFYdXQ0S05qRXJMcHZ1OWN3QjZYZUtzRGpyV1FOdDlYM0drWitXeTQw?=
 =?utf-8?B?N3FIZzRrbnU0ZG4wRDlkT2hBeTVVaWZGbkhvV3VjTGVVaEJGREg0RlhpWllK?=
 =?utf-8?B?dXgrZWZZdjJTZWJKMUJyWTh3WXRWQ0VvVE0zMTFqUUxvZ0RnQllTOU40anNx?=
 =?utf-8?B?Q0xkZjZ1ZHFsNmhIdUhoMjI5Y3MvZDk5R0oyd0EwZGhUZjUxQ3d4K2NSRVdH?=
 =?utf-8?B?M1BnSDFzQ0xRZUFuVS80RUducktNMnBVMmZzMFd1V3BkaUFQZzFKZld2ekVL?=
 =?utf-8?B?R0pTNmZJa2I0SEw1Q0RRaHh2NVQ1NHJPMUJsVThNNWJZVjJTZWdsTVhYNmh1?=
 =?utf-8?B?UFZ3N3ZpMU1xeXcrRWZjZ0JUS1hjMm1zajJRdUlJNUdRSE10di83YnF4Zkpi?=
 =?utf-8?B?WUs3aVFMTzBjalpTeFpuc3IxUWIxMG9hRStnVXZVUTJ6NTM1NTVwVjNMK3Vi?=
 =?utf-8?B?N1VlTk5XNUt0TlE4T09lR2Zickg0ZW9vdVEyekxqZWJ0cFVOM1BLWFc1dExk?=
 =?utf-8?B?K2QxS2RNWGpPeHJkODJkMHl5WG5JQ1gyNjZWTFFZN2crb1drb3p3aWJVWm1Z?=
 =?utf-8?B?dXU0VzZONmFxTzRWRmFXQUg5ZmpCNXh5V0YyekRlVytiODJRbnpkT0hKRndT?=
 =?utf-8?B?cDZCK0dUYmo5SUFYZHV2WEJVT0tPdytBa25qSDA1eHVkM1hTQlkwOFhWampQ?=
 =?utf-8?B?amRuNW5PSHp0UmRmak9uYiswZ2xIV2pFTUpPWUUwdm8ySldIT1c3SGFOU21q?=
 =?utf-8?B?N0FUTHNnOHIvSkQrT3VTZ2czM2lEVU1IRm9vMkNta3FxM240OWtYNFYyK3E2?=
 =?utf-8?B?ekVlanpHejBOY3BUVjZ2OCtaNlNiS0licHk1ZlNnOXhoZWR3YXhLckEyd0t0?=
 =?utf-8?B?dk9NSFZ5dXFtM3IyUlNQSS90QXY3V0JLVWpIdnNTYXpxa3BtNyswM29odjMz?=
 =?utf-8?Q?r2RRjKjAXHtpQvk4zdBJ?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0ccfc8-07de-4821-c13f-08da5bfe8448
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2022 07:43:12.5372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB0631
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_004320_821674_217B2AF6 
X-CRM114-Status: GOOD (  16.67  )
X-Mailman-Approved-At: Fri, 12 Aug 2022 02:06:54 -0700
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

SGksIEFsbAoKSSBoYXZlIHRlc3QgaXQgb24gVklNMSwgd2l0aCBrZXJuZWwgNS4xOS1yYzQuCml0
IHdvcmtzIGFzIGV4cGVjdGVkLgoKQlIuCk5pbmcuCgoK5Y+R5Lu25Lq6OiDlvKAg5a6BIDx6aGFu
Z24xOTg1QG91dGxvb2suY29tPgrlj5HpgIHml7bpl7Q6IDIwMjLlubQ25pyIMjfml6UgMTM6MjYK
5pS25Lu25Lq6OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZy5rZXJuZWxAZ21haWwuY29tPjsg
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnIDxsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+OyBOaWNrIDxuaWNrQGtoYWRhcy5jb20+OyBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CuS4u+mimDog5Zue5aSNOiBIb3cgdG8gdGVzdCBtZXNvbl9n
eF9wbSAKwqAKVGhhbmtzIE5laWwuCgpXYWtlIHVwIHNvdXJjZXMgYXJlIGNvbmZpZ3VyZWQgaW4g
QkwzMDEsIG5vIHJlbGF0ZWTCoCB0byBvdGhlciBwYXJ0cyBvZiBVLWJvb3QuCgpIaSwgTmljawoK
YXJlIHRoZXNlIHdha2UgdXAgc291cmNlcyAocG93ZXLCoCBrZXksIElSLCBibHVldG9vdGgpIGNv
cnJlY3RseSBjb25maWd1cmVkPwoKQlIuCk5pbmcuCgoKCgrlj5Hku7bkuro6IE5laWwgQXJtc3Ry
b25nIDxuYXJtc3Ryb25nLmtlcm5lbEBnbWFpbC5jb20+CuWPkemAgeaXtumXtDogMjAyMuW5tDbm
nIgyN+aXpSA5OjM5CuaUtuS7tuS6ujog5bygIOWugSA8emhhbmduMTk4NUBvdXRsb29rLmNvbT47
IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnPjsgTmljayA8bmlja0BraGFkYXMuY29tPjsgTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgrkuLvpopg6IFJlOiBIb3cgdG8gdGVzdCBtZXNvbl9neF9w
bSAKwqAKSGksCgpPbiAyNy8wNi8yMDIyIDEwOjUyLCDlvKAg5a6BIHdyb3RlOgo+IEhpLCBOZWls
Cj4KPiBJIHVuZGVyc3RhbmQgbWVzb25fZ3hfcG0gaXMgcmVqZWN0ZWQgYnkgdXBzdHJlYW1bMF0u
Cj4KPiBidXQgaXQncyBPSyB0byBhZGQgdGhpcyBkcml2ZXIgdG8gcGVyc29uYWwga2VybmVsIGJ1
aWxkIG9yIGRvd25zdHJlYW0ga2VybmVsIGJ1aWxkIGZvciBHWEJCLgo+Cj4gYXMgYSA2IHllYXJz
IG9sZCBkcml2ZXIsIGlzIGl0IHN0aWxsIHdvcmsgYXMgZXhwZWN0ZWQ/CgpObyBpZGVhLCBpdCBz
aG91bGQgYmUgdGVzdGVkLgoKPiBJIGZpbmQgdGhpcyBkcml2ZXIgaGFzIGJlZW4gYWRkZWQgdG8g
S2hhZGFzJ3MgbWFpbmxpbmUgbGludXggcmVsZWFzZSBmb3IgeWVhcnMuIGJ1dCB0aGV5IGRpZG4n
dCBkbyB0ZXN0cyB0aGlzIGRyaXZlci4KPgo+IGhvdyB0byB0ZXN0IHRoaXMgZHJpdmVyIGlzIGEg
cHJvYmxlbSBub3cuCj4KPiB0aGUgZHJpdmVyIGlzIGZvciBzdXNwZW5kLCB0aHVzIGNhbiBJIHVz
ZQo+ICIKPiAjIGVjaG8gbWVtID4gL3N5cy9wb3dlci9zdGF0ZQo+ICIKPiBmcm9tIGNvbW1hbmQg
bGluZT8KPgo+IEFuZCBob3cgdG8gd2FrZXVwIGRldmljZT8gcG93ZXIga2V5IG9uIFNCQz8KCkFu
eSB3YWtldXAgc291cmNlIGNvbmZpZ3VyZWQgaW4gYmwzMDEgY29kZSBlbWJlZGVkIGluIHRoZSBG
SVAgYm9vdGFibGUgYmluYXJ5IHNob3VsZCB3b3JrLgoKVXN1YWxseSBCbHVldG9vdGggJiBJUiBh
cmUgY29uZmlndXJlZCBpbiBhZGRpdGlvbiB0byBhIHBvd2VyIGtleSwgYnV0IHRoZSB2ZW5kb3Ig
dS1ib290IHNvdXJjZQoKc2hvdWxkIGJlIGNoZWNrZWQgdG8gY29uZmlybS4KCk5laWwKCj4KPiBC
Ui4KPiBOaW5nLgo+Cj4KPiBbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTQ3ODE4
MzM2NS0yMzcwOC0xLWdpdC1zZW5kLWVtYWlsLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
