Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7820C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jun 2022 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39d0uDAIYiKE4qHw6KLR+lCmSYrl9SDFhutSmT8A1qw=; b=2r2a3jcUQVw2f3
	LPx2LuyopvWy19reKJhohdkeey5wAgP6lTIAS4F0YK97z4//1c2Lsyj90b9qwWBuK6U2fgqImjS7i
	Mmd3DSOEH1ZbmHj7DA8ee/y4EKUFXQzHgbnZYhM9qNXJDWIATXtUxhHMhOJdWkgQhIyLH6ESsSuyN
	mfff4+6L3SjjP/Lb+kAgzLp1HSgVj1GHf8BlGyjweOIy0rC0lUGtJiq/2siUOnH5bdAcAnfFBeVzK
	WMVaT1KkQJdZJHiuWSUBFCUAPmJgmC6+l1aqO4eHQSU48oIVZ65fIvtfQsxKgj39Oc6nj32oYv76s
	28bN795ygO8BNX0OyC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65IF-004sMk-Bq; Tue, 28 Jun 2022 07:05:51 +0000
Received: from mail-tycjpn01olkn2060.outbound.protection.outlook.com ([40.92.99.60] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5okl-0018fq-Ga
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 13:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAtVhWarfPeMbXUiN97mezRAv8Zt5g/PKa3KK9d30PU0kWEuKAF5+lFZDpUaJCYGwfQvSkj/elP//tzvpagOBcQUp6bdMSSalduFAk8vw3wJx8PU46RJ2k+d+dTLaQRg/sHRZNWRC6nbuW9/XWr2gGcPfd+14n6iX/DSTCjG1/quP8DiFqaCrI8vZ0WfgFOJn2vWiakLGdjTwozFE8DnvJ/jFVyOV5e6V9NQgkwxricg8XbTCqZYCmH0TAyfsgMeFHKZL4xPtwAqv1uC+N0kzDBcwbodpl5SU0raMpVomA2SCnck2Mxx2abgXA1Wc9PUft4O/uPzCzjys686eSr9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP/048hjF9SMStD6JQi4GbhTrXznSX4YqdYh9WI31oI=;
 b=oPUg6lYLyp5Rg73oA92rKORfGAoenvmbvwVp8zCEZ6o6Z3qQq8cek6jGjicNZNaBwUbGkwQigtDiEcHnpXnGIhMMrqg4WIPnyh9IDdl3GfFiGuCcrNHwXvpywtxDAUuI/AJMHsGNOjk9Da9bsSAwZ6rD9aAcxfPqmMk69VbXhpSBMfiHoo3C2PoK2djpBZ3NWf7TOVbwkw4hb8qdjHozwK7sNfvjE1/ClijZsWz/01hThrlZ2cLUXqmy5nATJN+gzsa6+MrTbkkHptMilL0deY4R5yVG/061/kkudq7kjPrMIF5kvuCw86Fb2zc6y2zuHi5YUqLutFlXOGyUEZMKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP/048hjF9SMStD6JQi4GbhTrXznSX4YqdYh9WI31oI=;
 b=L8bmpyDniIMCggiY30oZd6yMNp3T/VV5JhM1qd6WX474nFWVS5vZX+tOPwDLd8+/sYV5TbMQhQoDFN8Wsa3zc6tKXFfWlrTuQ9t7RdlBs+HwpXdbSH9Oh0sFFJm3E8FcnrergDWBPYYPsgPmJFhyysAUIYsywfWN57GAU6akf56bgB6JqxMFy6EziagYJ2DMF+H/QC7MNHGzUTRzFp3hxptiKaVfzn8jrqSzI7+f14KpeNCuKqlIF8eDTPMr2zXa7OSJMbD3wOwAf4Zgq9jY4GKagKj4maqH6/oMQ9mVKSxYCMV3lM60cZkCmqa/qc+C1rlfN7TacH5kQ/wI8/n9Hw==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OSZP286MB0709.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 13:26:06 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::816e:460a:dd94:b94c%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:26:06 +0000
From: =?utf-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>
To: Neil Armstrong <narmstrong.kernel@gmail.com>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, Nick
	<nick@khadas.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: =?utf-8?B?5Zue5aSNOiBIb3cgdG8gdGVzdCBtZXNvbl9neF9wbQ==?=
Thread-Topic: How to test meson_gx_pm
Thread-Index: AQHYigGRzKmehYfgSk2cJU0i2Jxf9q1i/4aAgAA+Tto=
Date: Mon, 27 Jun 2022 13:26:06 +0000
Message-ID:  <OS0P286MB06413EEDA8411EA36A33DE16CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References:  <OS0P286MB06419BC49795C5CC383B8D75CDB99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <b2c13330-8c03-a08b-19d5-10afc8b28c2c@gmail.com>
In-Reply-To: <b2c13330-8c03-a08b-19d5-10afc8b28c2c@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1NIfgS/i3U0LJBevqnHQz3R2jWpgYjMt]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa94819-6428-47e3-0769-08da58409716
x-ms-traffictypediagnostic: OSZP286MB0709:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iU0cGygL8t5maWZn4jtIhVbbJIklUeE0ZUDp8ZgVfvd9G1Y71MCgxvKo5pCr8MGCgsIcqIGq0e8pg5OPm9MHCE9nxcpkHAhxQ/fYcIkO64VUcFdBR53VHC+ycXmS3Ys5xrIkW+5K2fcm1eTNugO1bU2sc32cR5wUzzNqdaVNM5sa3iiYRAQ5cHvL4ezgUYl8sexVBGH7KVeQMUwbIjtZwJsaArGYW871HMDxOxleLzSFCXlizFe5J3GcbCcyltzeRl6dAbKAtR+L9gY2faunake9fRuvz3O8eR+E+UMDdLkhLktNfrPDgDxBQ7iDsuOkNEYDRwE0Q5mLsudlqKh5WvdDFle48G70PVTCXIiysaKaXAOdOlsFgqxVaZYOY4L7B/Hw7bcFgnKOZSMeNQBYuH6nBB2rgJpB5kRpjImYCLdRgBD2pFNOR8bZKQYQn4wwa7HzQnGkoRKN9Z4ulpV0QlzH7E0ZccOlLv2NApyAFkg1mb3vd9B0JXtcmDUvKFwZJXrJtTJHv3myp3hzvIdp2iKAiI8DDw4BlhSh1iaD81CngaZhqLZGJYZmTy6R5sbNoFgiBiQo3cUxRNEGqDZWLgsddzkr/pB4tew/PE9QvYCGc+wAUZ5TKIYdn2TyTBANeoy3h6rNRjFM+ABaNZisiei2+xJXvTc9nq31XNevUM0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWVOK0NsUS9VbEY5SGRFZ05EbnIwNUJKK3RFUlc4NGcwNndEN2lVeTFHS2x6?=
 =?utf-8?B?dHFuTWljd0xXNzZFNytuaEVQU25xNmFDMUFrZ2grNG5WdVh6TUdSTHFIUkpm?=
 =?utf-8?B?UHFrdXkxNTM2NnRtSnNReFRQeUdwWkllY0tYeGpsNXdyWVpMNHgwcFhicVls?=
 =?utf-8?B?U3kydGZaWlMwRDFnS1ArdS9zS3B2Zk9jVzdUb2dxK0d3RE1aeks5U3NHQlR0?=
 =?utf-8?B?MnlwSHJYb0c1bS9KejJrem5jR3c4dUhJa3dmejVGaXdDbVFjOFdUWDhmcFFW?=
 =?utf-8?B?YUNOVzIvaXpFdTVEWHhaU0p0KzB0czM2cHEzSkxKMUVGNjVTem44YTJLNUR2?=
 =?utf-8?B?cVEreEozWmZ1SVVTbnIxSE1kZnRTSUh1WHI0TXRKZDN6aEtYR0pnMFkxK1lY?=
 =?utf-8?B?UTd4eDBCUlhNK0dFUkp0dGxwZ1dxaGNvN3RXQlV2bzh2THNyWWdPS3RqQ2hp?=
 =?utf-8?B?cUNrb3pMVEc5eUw0bTJlYVlvc2x6QVQ4RTFtRmExVCtnSHZPTnRwYWpPWTYv?=
 =?utf-8?B?RHVNSFJyZjBGNzlSZkdmQXBmU2xjMUJnUGZjSTU0dW1QbHNOMFVuN3RCZjB3?=
 =?utf-8?B?T2I5Y2RWZWhaeGFGZkg0Z2JFSGJUL240WjRpRVFQWmdrL3VpZmxXUlRVeXB4?=
 =?utf-8?B?TmxRKzhLYjF3dVNWbUhkTGlKYVlQdG9oYXEzMTZJc2ZXY1pUa3hHc3JQY1Zi?=
 =?utf-8?B?SStyeDEvVWdvcjBzWHlwU3k4ZzBGQlJraXNWTTBiNHpRa0RvY1JibXBqQ3BJ?=
 =?utf-8?B?TkE0M3BYMUlSTFVJd0dQT1NYWU1vdEFzZ0hwRk9Ba2xMSWpBWVIxRmwxeExa?=
 =?utf-8?B?MWxPV2RIMlVBUHJSbEQ0TDUvelBCWlZYMW5SQnNHS3ZOZ1BieUxpaHJEa1d2?=
 =?utf-8?B?dXY4b0FPR0tFMVVOMVZ5TlFoci9BOFlLcGQ5T3AwZkhlZzlzZ0tmLzM4RUpS?=
 =?utf-8?B?eGdYc3V2T3dGR2I4S0Z0aGtRSGgrTjAzZlIxZDFCV21OeEZUbHJaSCtvTWgz?=
 =?utf-8?B?KzBEY01CTmpMUWtxZEVWOUg4cWd4SC9CZnJkWWgydG5HVTBXeTNpWloxS0xZ?=
 =?utf-8?B?d3Q4L0E0d0NJdVFNVnJYVWd3RVZHZ2YxZmYzUnpoVzluZDlLT1oyOHdVaXQ5?=
 =?utf-8?B?dm56WGh5d1d5M3FrczQ1U2ovclB1NlU4TGNFTWpWWmZwWmgwVjdka3AzVStS?=
 =?utf-8?B?TXZWRmxpZ0VrZ29hNVVsQ2hKRjFzOHpYL244cXVwZ3ZQZ0lvNWNlTk1nZVo2?=
 =?utf-8?B?aGVCRkQ4S1NrSnUwVWJnaS9EeVN4cnNhUDI5ZjR1MnNFK2h3TFpkaHV4V2sv?=
 =?utf-8?B?UGcrdFFWNVZ6WWhZM0Yvd1FMQy9zb2F0dVdZd1BDUm53NThKdGFiWlhzdGQv?=
 =?utf-8?B?SEdwd1c2Q2JvRHJTS2xoZU5jL3l3NTJpZmxRaCsrdWpOYS9VS0pYOFVJdFoy?=
 =?utf-8?B?YWg0TGluUGNWU25BbmtvbytIWUxsbTd4c3lXY1FLcXZSeXUvYllYQjllYlA1?=
 =?utf-8?B?ZVNjYms4Q2IzT1BxdmFhbjlwV0w4UnpldlBWdjlKSHdLbnVBbEFyOElyR2Rv?=
 =?utf-8?B?RXF0R3crandhNWpsR0xQWUppeSttUE05RlkrTDFRRDJkZmZoelZHMXMrMGJK?=
 =?utf-8?B?OVVZZmM5Mk5KZFRMVnl2VmYwRXdqeGR1S3dpeDNOSlRxSFo4enBUMGVYQTB1?=
 =?utf-8?Q?V9vU0HOOkGz9q4QJ1icb?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa94819-6428-47e3-0769-08da58409716
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 13:26:06.1676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0709
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_062611_621602_7D281604 
X-CRM114-Status: GOOD (  14.96  )
X-Mailman-Approved-At: Tue, 28 Jun 2022 00:05:50 -0700
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

VGhhbmtzIE5laWwuCgpXYWtlIHVwIHNvdXJjZXMgYXJlIGNvbmZpZ3VyZWQgaW4gQkwzMDEsIG5v
IHJlbGF0ZWQgIHRvIG90aGVyIHBhcnRzIG9mIFUtYm9vdC4KCkhpLCBOaWNrCgphcmUgdGhlc2Ug
d2FrZSB1cCBzb3VyY2VzIChwb3dlciAga2V5LCBJUiwgYmx1ZXRvb3RoKSBjb3JyZWN0bHkgY29u
ZmlndXJlZD8KCkJSLgpOaW5nLgoKCgoK5Y+R5Lu25Lq6OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZy5rZXJuZWxAZ21haWwuY29tPgrlj5HpgIHml7bpl7Q6IDIwMjLlubQ25pyIMjfml6UgOToz
OQrmlLbku7bkuro6IOW8oCDlroEgPHpoYW5nbjE5ODVAb3V0bG9vay5jb20+OyBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
Zz47IE5pY2sgPG5pY2tAa2hhZGFzLmNvbT47IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4K5Li76aKYOiBSZTogSG93IHRvIHRlc3QgbWVzb25fZ3hfcG0gCsKgCkhpLAoK
T24gMjcvMDYvMjAyMiAxMDo1Miwg5bygIOWugSB3cm90ZToKPiBIaSwgTmVpbAo+Cj4gSSB1bmRl
cnN0YW5kIG1lc29uX2d4X3BtIGlzIHJlamVjdGVkIGJ5IHVwc3RyZWFtWzBdLgo+Cj4gYnV0IGl0
J3MgT0sgdG8gYWRkIHRoaXMgZHJpdmVyIHRvIHBlcnNvbmFsIGtlcm5lbCBidWlsZCBvciBkb3du
c3RyZWFtIGtlcm5lbCBidWlsZCBmb3IgR1hCQi4KPgo+IGFzIGEgNiB5ZWFycyBvbGQgZHJpdmVy
LCBpcyBpdCBzdGlsbCB3b3JrIGFzIGV4cGVjdGVkPwoKTm8gaWRlYSwgaXQgc2hvdWxkIGJlIHRl
c3RlZC4KCj4gSSBmaW5kIHRoaXMgZHJpdmVyIGhhcyBiZWVuIGFkZGVkIHRvIEtoYWRhcydzIG1h
aW5saW5lIGxpbnV4IHJlbGVhc2UgZm9yIHllYXJzLiBidXQgdGhleSBkaWRuJ3QgZG8gdGVzdHMg
dGhpcyBkcml2ZXIuCj4KPiBob3cgdG8gdGVzdCB0aGlzIGRyaXZlciBpcyBhIHByb2JsZW0gbm93
Lgo+Cj4gdGhlIGRyaXZlciBpcyBmb3Igc3VzcGVuZCwgdGh1cyBjYW4gSSB1c2UKPiAiCj4gIyBl
Y2hvIG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUKPiAiCj4gZnJvbSBjb21tYW5kIGxpbmU/Cj4KPiBB
bmQgaG93IHRvIHdha2V1cCBkZXZpY2U/IHBvd2VyIGtleSBvbiBTQkM/CgpBbnkgd2FrZXVwIHNv
dXJjZSBjb25maWd1cmVkIGluIGJsMzAxIGNvZGUgZW1iZWRlZCBpbiB0aGUgRklQIGJvb3RhYmxl
IGJpbmFyeSBzaG91bGQgd29yay4KClVzdWFsbHkgQmx1ZXRvb3RoICYgSVIgYXJlIGNvbmZpZ3Vy
ZWQgaW4gYWRkaXRpb24gdG8gYSBwb3dlciBrZXksIGJ1dCB0aGUgdmVuZG9yIHUtYm9vdCBzb3Vy
Y2UKCnNob3VsZCBiZSBjaGVja2VkIHRvIGNvbmZpcm0uCgpOZWlsCgo+Cj4gQlIuCj4gTmluZy4K
Pgo+Cj4gWzBdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzE0NzgxODMzNjUtMjM3MDgt
MS1naXQtc2VuZC1lbWFpbC1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbS8KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
