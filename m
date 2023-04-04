Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC52AC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4AdN2ZMAsfBakl38AHRoJQm+5TQLX8hYzHaQ7nwYlw=; b=aOvHpZUgGskGEl
	caIipdejSpk3MeU2dkJu0/P85Zcg5tzS7qGkvaPXnfgTQYYdfA5jbvX4tCAvXTapAxdFG9WrHc2MV
	f6hZ8771Klx9P2oYbHCgFcuoT6vT057Zxsrqr2ToBeIlE8DMddA1/9oFOa1i8ieLa9BKVI09bpHY+
	7uuM438RdvukaMDkmF7kvIlHSTa2YcD+bBs8sQ98UodHwiiJAvJoxMHHt8MyfeQuYwYhKOdWaRnIO
	MCnoMnH8VlnwI2/ou9Y8Qetp02iaKSW+iFBgV0+0FPWBSavtz2TvzEtwud5lKSjASovP5cV22nU9Y
	psiR5veGsLleKApDIamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjj4b-00289D-1f;
	Tue, 04 Apr 2023 15:59:53 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjj4X-00287U-1K
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 15:59:52 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8E078200483;
	Tue,  4 Apr 2023 17:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680623987;
	bh=CzvvgTblGhaF/J7bVlIXcfhbbcQ7ryI5eYdk4LdJQkw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VbGIfF4WDXmiHdI/d3y2APmUG8N17SSZEvysy8Jmpz+SQXB1wR0+k2jnkWTHNiIrx
	 0enP5G+xmxoAMKV5yhhh2PpmL6Mx1kWJVLaekplNG5sceFEPSh9uFaccuRzldjYLD9
	 ++r23Tjrz3L0vQmPgkXeO1frRUkNI6+VPo7wfMCPsDETRaGoIYYe/zSCmHDaRELNaS
	 EqcIFTSeOEhxHtbrHlzkMpTF/e35S+h17yi/YL+V14kfXd29v/Q6N/9URcwWEYyznV
	 rkgDSWkw46TFYPREv9ctjX/JQZZWGfYkeNRV91TdFvw/axbaZuJ5NrjRP5fTZPIB1v
	 Dm5GAZSOvA4EQ==
Message-ID: <602e992f-514c-65e2-f45f-17c088af3a61@free.fr>
Date: Tue, 4 Apr 2023 17:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: linux-amlogic@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
 <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
 <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
 <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
 <f14407f1-e16f-0074-6e29-c597754ae617@free.fr>
 <CA+8PC_dFTvv9VtY9jBWLLwSoQzGxQd57zWMsnN6amddop4Yw-g@mail.gmail.com>
 <31dea9bf-63ef-c6db-b206-8afac960fd10@free.fr>
In-Reply-To: <31dea9bf-63ef-c6db-b206-8afac960fd10@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_085949_600767_202EE664 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

T24gMjIvMDMvMjAyMyAxODo0MCwgTWFyYyBHb256YWxleiB3cm90ZToKCj4gQXQgbXkgZGlzcG9z
YWwsIHR3byBTOTA1WDIgYm9hcmRzIHdpdGggU0RJTy1iYXNlZCBicmNtIG1vZHVsZXMKPiAoYWNj
b3JkaW5nIHRvIHRoZSBsYWJlbHMgb24gdGhlIGJvYXJkcykgOgo+IAo+IEJvYXJkIEEgZW1iZWRz
ICJBUDYzOThTUjMiICB3aGljaCBpZGVudGlmaWVzIGFzCj4gCXggdmVuZG9yPTJkMCBkZXY9NDM1
OSBvdmVyIHNkaW9fcmVhZF9jaXMKPiAJeCBicmNtZm1hYzogRjEgc2lnbmF0dXJlIHJlYWQgQDB4
MTgwMDAwMDA9MHgxNzI5NDM1OQo+IAl4IGJyY21mbWFjOiBCQ000MzU5Lzk6IGNoaXA9NDM1OSBy
ZXY9OQo+IAo+IEJvYXJkIEIgZW1iZWRzICJBUDYzOThTUjMyIiB3aGljaCBpZGVudGlmaWVzIGFz
Cj4gCXggdmVuZG9yPTJkMCBkZXY9YWFlNyBvdmVyIHNkaW9fcmVhZF9jaXMKPiAJeCBGMSBzaWdu
YXR1cmUgcmVhZCBAMHgxODAwMDAwMD0weDEwNDJhYWU4Cj4gCXggYnJjbWZtYWM6IEJDTTQzNzUy
LzI6IGNoaXA9YWFlOCByZXY9MgoKUGFsaSBSb2jDoXIgcG9pbnRlZCBvdXQgbHNzZGlvLgpIZXJl
J3MgdGhlIHZlcmJvc2Ugb3V0cHV0LCBmb3IgdGhlIHJlY29yZC4KCgpCT0FSRCBBCiMgbHNzZGlv
IC12Ckhvc3QgMiBBZGRyZXNzIDAwMDEgRnVuY3Rpb24gMTogSUQgMDJkMDo0MzU5IAogICAgQ29t
bW9uIEFkZHJlc3M6IDB4MDAwMQogICAgQ29tbW9uIFZERCB2b2x0YWdlOiAzLjItMy40VgogICAg
Q29tbW9uIFR5cGU6IFNESU8KICAgIENvbW1vbiBWZW5kb3IgSUQ6IDB4MDJkMAogICAgQ29tbW9u
IERldmljZSBJRDogMHg0MzU5CiAgICBDb21tb24gUmV2aXNpb246IDAuMAogICAgRnVuY3Rpb24g
SUQ6IDEKICAgIEZ1bmN0aW9uIFZlbmRvciBJRDogMHgwMmQwCiAgICBGdW5jdGlvbiBEZXZpY2Ug
SUQ6IDB4NDM1OQogICAgRnVuY3Rpb24gQ2xhc3MgSUQ6IDB4MDAKICAgIEZ1bmN0aW9uIFJldmlz
aW9uOiAwLjAKICAgIEZ1bmN0aW9uIERyaXZlciBpbiB1c2U6IGJyY21mbWFjCkhvc3QgMiBBZGRy
ZXNzIDAwMDEgRnVuY3Rpb24gMjogSUQgMDJkMDo0MzU5IAogICAgQ29tbW9uIEFkZHJlc3M6IDB4
MDAwMQogICAgQ29tbW9uIFZERCB2b2x0YWdlOiAzLjItMy40VgogICAgQ29tbW9uIFR5cGU6IFNE
SU8KICAgIENvbW1vbiBWZW5kb3IgSUQ6IDB4MDJkMAogICAgQ29tbW9uIERldmljZSBJRDogMHg0
MzU5CiAgICBDb21tb24gUmV2aXNpb246IDAuMAogICAgRnVuY3Rpb24gSUQ6IDIKICAgIEZ1bmN0
aW9uIFZlbmRvciBJRDogMHgwMmQwCiAgICBGdW5jdGlvbiBEZXZpY2UgSUQ6IDB4NDM1OQogICAg
RnVuY3Rpb24gQ2xhc3MgSUQ6IDB4MDAKICAgIEZ1bmN0aW9uIFJldmlzaW9uOiAwLjAKICAgIEZ1
bmN0aW9uIERyaXZlciBpbiB1c2U6IGJyY21mbWFjCkhvc3QgMiBBZGRyZXNzIDAwMDEgRnVuY3Rp
b24gMzogSUQgMDJkMDo0MzU5IChDbGFzcyAwMikKICAgIENvbW1vbiBBZGRyZXNzOiAweDAwMDEK
ICAgIENvbW1vbiBWREQgdm9sdGFnZTogMy4yLTMuNFYKICAgIENvbW1vbiBUeXBlOiBTRElPCiAg
ICBDb21tb24gVmVuZG9yIElEOiAweDAyZDAKICAgIENvbW1vbiBEZXZpY2UgSUQ6IDB4NDM1OQog
ICAgQ29tbW9uIFJldmlzaW9uOiAwLjAKICAgIEZ1bmN0aW9uIElEOiAzCiAgICBGdW5jdGlvbiBW
ZW5kb3IgSUQ6IDB4MDJkMAogICAgRnVuY3Rpb24gRGV2aWNlIElEOiAweDQzNTkKICAgIEZ1bmN0
aW9uIENsYXNzIElEOiAweDAyCiAgICBGdW5jdGlvbiBSZXZpc2lvbjogMC4wCiAgICBGdW5jdGlv
biBEcml2ZXIgaW4gdXNlOiAobm9uZSkKCgpCT0FSRCBCCiMgbHNzZGlvIC12Ckhvc3QgMiBBZGRy
ZXNzIDAwMDEgRnVuY3Rpb24gMTogSUQgMDJkMDphYWU3IAogICAgQ29tbW9uIEFkZHJlc3M6IDB4
MDAwMQogICAgQ29tbW9uIFZERCB2b2x0YWdlOiAzLjItMy40VgogICAgQ29tbW9uIFR5cGU6IFNE
SU8KICAgIENvbW1vbiBWZW5kb3IgSUQ6IDB4MDJkMAogICAgQ29tbW9uIERldmljZSBJRDogMHhh
YWU3CiAgICBDb21tb24gUmV2aXNpb246IDAuMAogICAgRnVuY3Rpb24gSUQ6IDEKICAgIEZ1bmN0
aW9uIFZlbmRvciBJRDogMHgwMmQwCiAgICBGdW5jdGlvbiBEZXZpY2UgSUQ6IDB4YWFlNwogICAg
RnVuY3Rpb24gQ2xhc3MgSUQ6IDB4MDAKICAgIEZ1bmN0aW9uIFJldmlzaW9uOiAwLjAKICAgIEZ1
bmN0aW9uIERyaXZlciBpbiB1c2U6IChub25lKQpIb3N0IDIgQWRkcmVzcyAwMDAxIEZ1bmN0aW9u
IDI6IElEIDAyZDA6YWFlNyAKICAgIENvbW1vbiBBZGRyZXNzOiAweDAwMDEKICAgIENvbW1vbiBW
REQgdm9sdGFnZTogMy4yLTMuNFYKICAgIENvbW1vbiBUeXBlOiBTRElPCiAgICBDb21tb24gVmVu
ZG9yIElEOiAweDAyZDAKICAgIENvbW1vbiBEZXZpY2UgSUQ6IDB4YWFlNwogICAgQ29tbW9uIFJl
dmlzaW9uOiAwLjAKICAgIEZ1bmN0aW9uIElEOiAyCiAgICBGdW5jdGlvbiBWZW5kb3IgSUQ6IDB4
MDJkMAogICAgRnVuY3Rpb24gRGV2aWNlIElEOiAweGFhZTcKICAgIEZ1bmN0aW9uIENsYXNzIElE
OiAweDAwCiAgICBGdW5jdGlvbiBSZXZpc2lvbjogMC4wCiAgICBGdW5jdGlvbiBEcml2ZXIgaW4g
dXNlOiAobm9uZSkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
