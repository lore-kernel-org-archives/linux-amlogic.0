Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EE6C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 05:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7432222527
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 05:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dW++Wn9o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="tJUDM91F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7432222527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aTG8Nw6TAhaltW6Yo8RN132eUHrebRrGET1YsyIBSQU=; b=dW++Wn9ocnW5Sq62IFyCboy2x
	Tjj5n3eNie7VYAPITWGQH8gMhsyExTsccq8AHl26MMTx7RaZbSW7cz5OI7+C607oX0Ka+pZ2QNwPc
	0DAZnltcNXNIt1deuTIr5YmG8sEwBQqRidAK974Wlhc17sQtJpP9v6oMaq7sBSpsLX4vtanqDUIjH
	2WneK8nv/PP9dEFUGRwou7QijRK2FmC9hDLt7c7JoYHV5RpQrd51g16YRw6wW7SrQ2ZsdIGeOZz4l
	0ijUeNUVCejuEWzon7m4n4PCtejD+P3zr/GLT4s8UYRgynRYuPfpYlWX676gsEbcoFreknjQv3hSd
	QCHeuTZgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifdoK-0004nn-RL; Fri, 13 Dec 2019 05:48:20 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifdoG-0004nK-US; Fri, 13 Dec 2019 05:48:19 +0000
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Z07x485Xz9vBmP;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tJUDM91F; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oCzNs4uejCNs; Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Z07x2Rs1z9vBmM;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576216093; bh=BQ4d7QEkMTRg8NOsdUyvc3JEDM4PmMIcEcEHrzBdpQ0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tJUDM91FyihxCBUCfFONne7ugnZ8iFFeKeUQhj+N7T959PqG9XA7xm4Hfu7DJwAh+
 hP58T8c8CUvb3JGkH19+z140v8xtKBh8ia6dxZOab4uPVWMB9dPLkdIpGghqUpSp4U
 9hKoG1jcwVd/ZPi639cOGIPW5ekef16kOiozYIvw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D4898B767;
 Fri, 13 Dec 2019 06:48:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g7Rfokag1FcC; Fri, 13 Dec 2019 06:48:13 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C95628B893;
 Fri, 13 Dec 2019 06:47:58 +0100 (CET)
Subject: Re: [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
References: <20191213000657.931618-1-dima@arista.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
Date: Fri, 13 Dec 2019 06:47:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_214817_278541_A8B0682C 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Alexander Shiyan <shc_work@mail.ru>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Kees Cook <keescook@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Patrice Chotard <patrice.chotard@st.com>, Tony Prisk <linux@prisktech.co.nz>,
 Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-fsdevel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxMy8xMi8yMDE5IMOgIDAxOjA1LCBEbWl0cnkgU2Fmb25vdiBhIMOpY3JpdMKgOgo+IFRo
ZSBvcmlnaW5hbCBwdXJwb3NlIG9mIHRoZSBwYXRjaGVzIHNldCB3YXMgdG8gYWRkIGEgd2F5IHRv
IGVuYWJsZQo+IHN5c3JxIG9uIGEgdWFydCB3aGVyZSBjdXJyZW50bHkgaXQgY2FuIGJlIGNvbnN0
YW50bHkgZWl0aGVyIG9uIG9yIG9mZgo+IChDT05GSUdfTUFHSUNfU1lTUlFfU0VSSUFMKSwgc2Vl
IHRoZSBsYXN0IHBhdGNoOgo+ICAgICJzZXJpYWwvc3lzcnE6IEFkZCBNQUdJQ19TWVNSUV9TRVJJ
QUxfU0VRVUVOQ0UiCj4gCj4gQnV0IHRvIGRvIHRoYXQsIEkgaGFkIHRvIGFkZCB1YXJ0X3RyeV90
b2dnbGVfc3lzcnEoKSBhbmQgSSBkaWRuJ3Qgd2FudAo+IHRvIGJsb2F0IHNlcmlhbF9jb3JlLmgg
ZXZlbiBtb3JlLiBTbywgSSBkaWQgY2xlYW51cCBieSByZW1vdmluZwo+IFNVUFBPUlRfU1lTUlEg
cmVzdWx0aW5nIGluIGEgbmljZSBkaWZmLXN0YXQgYW5kIGxlc3NlciBpZmRlZmZlcnkuCj4gCj4g
TW9zdCBwYXRjaGVzIGFyZSBvbmUtbGluZXJzLCBJIGRlY2lkZWQgdG8ga2VlcCB0aGVtIHNlcGFy
YXRlZCBwZXItZHJpdmVyCj4gdG8gbGV0IHJldmlld2VycyBlYXNpZXIgZm9sbG93IHRoZSBwdXJw
b3NlLgo+IAo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+IENjOiBKaXJpIFNsYWJ5IDxqc2xhYnlAc3VzZS5jb20+Cj4gQ2M6IFZhc2lsaXkgS2hv
cnV6aGljayA8dmFzaWx5a2hAYXJpc3RhLmNvbT4KPiBDYzogbGludXgtc2VyaWFsQHZnZXIua2Vy
bmVsLm9yZwo+IAo+IERtaXRyeSBTYWZvbm92ICg1OCk6Cj4gICAgc3lzcnE6IFJlbW92ZSBzeXNy
cV9oYW5kbGVyX3JlZ2lzdGVyZWQKPiAgICBzZXJpYWw6IE1vdmUgc3lzcnEgbWVtYmVycyBhYm92
ZQo+ICAgIHNlcmlhbF9jb3JlOiBVbi1pZmRlZiBzeXNycSBTVVBQT1JUX1NZU1JRCj4gICAgdHR5
L3NlcmlhbDogTWlncmF0ZSBhc3BlZWRfdnVhcnQgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9z
ZXJpYWw6IE1pZ3JhdGUgODI1MF9mc2wgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6
IE1pZ3JhdGUgYmNtNjN4eF91YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBN
aWdyYXRlIDgyNTBfb21hcCB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0
ZSA4MjUwX3BvcnQgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgYW1i
YS1wbDAxKiB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBhcGJ1YXJ0
IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIGFyY191YXJ0IHRvIHVz
ZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIGF0bWVsX3NlcmlhbCB0byB1c2Ug
aGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBjbHBzNzExeCB0byB1c2UgaGFzX3N5
c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBjcG1fdWFydCB0byB1c2UgaGFzX3N5c3JxCj4g
ICAgdHR5L3NlcmlhbDogTWlncmF0ZSBkeiB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3Nlcmlh
bDogTWlncmF0ZSBlZm0zMi11YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBN
aWdyYXRlIGZzbF9saW5mbGV4dWFydCB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDog
TWlncmF0ZSBmc2xfbHB1YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdy
YXRlIGlteCB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBpcDIyemls
b2cgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgbWVzb25fdWFydCB0
byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBtaWxiZWF1dF91c2lvIHRv
IHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIG1wYzUyeHhfdWFydCB0byB1
c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogRG9uJ3QgemVybyBwb3J0LT5zeXNycQo+ICAg
IHR0eS9zZXJpYWw6IE1pZ3JhdGUgbXNtX3NlcmlhbCB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5
L3NlcmlhbDogTWlncmF0ZSBtdXggdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1p
Z3JhdGUgbXhzLWF1YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRl
IG9tYXAtc2VyaWFsIHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIHBj
aF91YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBEb24ndCBjaGVjayBwb3J0
LT5zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgcG1hY196aWxvZyB0byB1c2UgaGFzX3N5
c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBwbng4eHh4X3VhcnQgdG8gdXNlIGhhc19zeXNy
cQo+ICAgIHNlcmlhbC9mODE1MzQ6IERvbid0IGNoZWNrIHBvcnQtPnN5c3JxCj4gICAgdHR5L3Nl
cmlhbDogTWlncmF0ZSBweGEgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3Jh
dGUgcWNvbV9nZW5pX3NlcmlhbCB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWln
cmF0ZSBzYTExMDAgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgc2Ft
c3VuZ190dHkgdG8gdXNlIGhhc19zeXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgc2IxMjUw
LWR1YXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIHNjY254cCB0
byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBzZXJpYWxfdHh4OSB0byB1
c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBzaC1zY2kgdG8gdXNlIGhhc19z
eXNycQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgc3ByZF9zZXJpYWwgdG8gdXNlIGhhc19zeXNy
cQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgc3QtYXNjIHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0
dHkvc2VyaWFsOiBNaWdyYXRlIHN0bTMyLXVzYXJ0IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkv
c2VyaWFsOiBNaWdyYXRlIHN1bmh2IHRvIHVzZSBoYXNfc3lzcnEKPiAgICB0dHkvc2VyaWFsOiBN
aWdyYXRlIHN1bnNhYiB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBz
dW5zdSB0byB1c2UgaGFzX3N5c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSBzdW56aWxvZyB0
byB1c2UgaGFzX3N5c3JxCj4gICAgc2VyaWFsL3VjY191YXJ0OiBSZW1vdmUgaWZkZWYgU1VQUE9S
VF9TWVNSUQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgdnI0MXh4X3NpdSB0byB1c2UgaGFzX3N5
c3JxCj4gICAgdHR5L3NlcmlhbDogTWlncmF0ZSB2dDg1MDBfc2VyaWFsIHRvIHVzZSBoYXNfc3lz
cnEKPiAgICB0dHkvc2VyaWFsOiBNaWdyYXRlIHhpbGlueF91YXJ0cHMgdG8gdXNlIGhhc19zeXNy
cQo+ICAgIHR0eS9zZXJpYWw6IE1pZ3JhdGUgenMgdG8gdXNlIGhhc19zeXNycQo+ICAgIHNlcmlh
bF9jb3JlOiBSZW1vdmUgU1VQUE9SVF9TWVNSUSBpZmRlZmZlcnkKPiAgICB1c2Ivc2VyaWFsOiBE
b24ndCBoYW5kbGUgYnJlYWsgd2hlbiBDT05GSUdfTUFHSUNfU1lTUlEgaXMgZGlzYWJsZWQKPiAg
ICBzZXJpYWxfY29yZTogTW92ZSBzeXNycSBmdW5jdGlvbnMgZnJvbSBoZWFkZXIgZmlsZQo+ICAg
IHN5c2N0bC9zeXNycTogUmVtb3ZlIF9fc3lzcnFfZW5hYmxlZCBjb3B5Cj4gICAgc2VyaWFsL3N5
c3JxOiBBZGQgTUFHSUNfU1lTUlFfU0VSSUFMX1NFUVVFTkNFCgpwb3dlcnBjIHBhdGNod29yayBk
aWRuJ3QgZ2V0IHRoZSBmdWxsIHNlcmllcywgc2VlIApodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0xNDgxOTgKCkNhbid0IGZpbmQg
dGhlbSBvbiBsaW51eC1zZXJpYWwgcGF0Y2h3b3JrIGVpdGhlciAKKGh0dHBzOi8vcGF0Y2hlcy5s
aW5hcm8ub3JnL3Byb2plY3QvbGludXgtc2VyaWFsL2xpc3QvKQoKSXQgaXMgaW1wb3NzaWJsZSB0
byByZXZpZXcvdGVzdCBwb3dlcnBjIGJpdHMgd2l0aG91dCB0aGUgZmlyc3QgcGF0Y2hlcyAKb2Yg
dGhlIHNlcmllcywgd2hlcmUgY2FuIHRoZSBlbnRpcmUgc2VyaWVzIGJlIGZvdW5kID8KCkNocmlz
dG9waGUKCj4gCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYyAgICAgICAg
IHwgICA0ICstCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2FzcGVlZF92dWFydC5j
IHwgICA1ICstCj4gICBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2ZzbC5jICAgICAgICAg
IHwgICA0IC0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfb2YuYyAgICAgICAgICAg
fCAgIDQgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfb21hcC5jICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfcG9ydC5jICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9hbWJhLXBsMDEwLmMgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9hbWJhLXBsMDExLmMgICAgICAgICAgICAg
fCAgIDYgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9hcGJ1YXJ0LmMgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9hdG1lbF9zZXJpYWwuYyAgICAgICAgICAg
fCAgIDkgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9iY202M3h4X3VhcnQuYyAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9jbHBzNzExeC5jICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jb3JlLmMg
fCAgIDkgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9kei5jICAgICAgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9lZm0zMi11YXJ0LmMgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9mc2xfbGluZmxleHVhcnQuYyAgICAgICAg
fCAgIDggKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9mc2xfbHB1YXJ0LmMgICAgICAgICAgICAg
fCAgIDkgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9pbXguYyAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9pcDIyemlsb2cuYyAgICAgICAgICAgICAg
fCAgIDcgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9taWxiZWF1dF91c2lvLmMgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tcGM1Mnh4X3VhcnQuYyAgICAgICAgICAg
fCAgMTEgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tc21fc2VyaWFsLmMgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9tdXguYyAgICAgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9teHMtYXVhcnQuYyAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9vbWFwLXNlcmlhbC5jICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9wY2hfdWFydC5jICAgICAgICAgICAgICAg
fCAgMTIgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9wbWFjX3ppbG9nLmMgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9wbng4eHh4X3VhcnQuYyAgICAgICAgICAg
fCAgIDcgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9weGEuYyAgICAgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9xY29tX2dlbmlfc2VyaWFsLmMgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zYTExMDAuYyAgICAgICAgICAgICAgICAg
fCAgIDcgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zYW1zdW5nX3R0eS5jICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zYjEyNTAtZHVhcnQuYyAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zY2NueHAuYyAgICAgICAgICAgICAgICAg
fCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jICAgICAgICAgICAg
fCAxMjMgKysrKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxf
dHh4OS5jICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2ku
YyAgICAgICAgICAgICAgICAgfCAgMTAgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zcHJkX3Nl
cmlhbC5jICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdC1hc2Mu
YyAgICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11
c2FydC5jICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdW5odi5j
ICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdW5zYWIu
YyAgICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdW5zdS5j
ICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdW56aWxv
Zy5jICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC91Y2NfdWFy
dC5jICAgICAgICAgICAgICAgfCAgIDIgLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL3ZyNDF4eF9z
aXUuYyAgICAgICAgICAgICB8ICAgNSArLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL3Z0ODUwMF9z
ZXJpYWwuYyAgICAgICAgICB8ICAgNSArLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL3hpbGlueF91
YXJ0cHMuYyAgICAgICAgICB8ICAgNSArLQo+ICAgZHJpdmVycy90dHkvc2VyaWFsL3pzLmMgICAg
ICAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICAgZHJpdmVycy90dHkvc3lzcnEuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxNiArLS0KPiAgIGRyaXZlcnMvdXNiL3NlcmlhbC9mODE1MzQu
YyAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgIGRyaXZlcnMvdXNiL3NlcmlhbC9nZW5lcmlj
LmMgICAgICAgICAgICAgICAgfCAgMTAgKy0KPiAgIGluY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUu
aCAgICAgICAgICAgICAgICAgfCAgOTIgKystLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4
L3N5c3JxLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIGtlcm5lbC9zeXNjdGwu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDEgKysrKy0tLQo+ICAgbGliL0tjb25m
aWcuZGVidWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArKwo+ICAgNTggZmlsZXMg
Y2hhbmdlZCwgMjM4IGluc2VydGlvbnMoKyksIDM0NiBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
