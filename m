Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5943EC43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxGDki9bAqRvYjEN2EEQ7BWW2fdDIcQ2893QeEkgHrw=; b=y0gvlcVwo+h8tg
	3ULSg2kkgZuMB9E+OhHB+04uqfdh+2lnDCNc66RT3DVIDOkjHnhXswpBrJTB6eps/lOYwnm0AL2uC
	kM1N4LLtOcKW4T4qM6eEKyRYZiMt7g5E4WI6zarIS0C1Oqi13CMB/rChqDGY4QFhi8B5F6taC0N9y
	Lh9UztkL05g3LD9pJGftdQVSdoNzkf9HfrnXQGGFZUw0Gnqzt5lg3UUE9WjVZGy/mtbqTDBT3AU3Z
	uc3lI+dBthYj1GCXtysTW0wZ1fXUEbkhFgRPmgaaAIGa3fCup2jkhKYLbHA1kaPQ5SKFEcVDrnq2q
	E2NpQJNiKtr/6DuPFsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVYM-0000000Gbo0-2dgx;
	Tue, 30 Jun 2026 10:18:54 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVYK-0000000Gbmf-2C0C
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 10:18:53 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so172090966b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 03:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814730; x=1783419530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=;
        b=OZitGg2Zq+bYbv+pBY5mFiIHDEUyozRAfhe88OnrghQS+FpdVr/9pqkhOkYJZ+y3fJ
         8YXbsDv27nt15zWs6bjmH9gqQ6iWRVQDZ/me/qWE+bGzkgWHwxggOr84KyD+nHgrndiQ
         4qm2h0O51fDQvuTuE3lsOpesF0cM+HVNUdY6AAN87AFmR4UHkcmx5qthQ9Ef6hamePiY
         pntD9jZ19JENmKBz7Cif/L4+iRnL6v6mDGq0IN9yGZyF+5NGdl2qmsax7DDkn0+eDyIf
         cHpzLlUkh2AnEF/vOliXQd6dtsnkHp5HxtsCX+sDAOE+GiTDp1LHAbfVX6/Jmw/7Lg2+
         tezA==
X-Forwarded-Encrypted: i=1; AHgh+RrdvrElDJk270ZZmr7Aog6Lgs+7pmpNQqPWBm+940KOblgxyXCTL+vje7jq84fdtp3RS4ChlM9cuQJJolel@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3h8jjkwkgWP8o+CtKzuPyeQFVtrC3kkyAAmCxsHdiOjE3e/Su
	bh2Z5MJaSigiDfNA79Hfy5jDesQ742K8rlrUmpIlwqjekr7DSSHg72bnvbquOTJ+5nI=
X-Gm-Gg: AfdE7cnFuZzZcQGWsYVz5XZ5QTymrRxx7QhuLwnELQsu4Sb6u5dwYEdgE8nGYX9CnN1
	S5DhbpYs9tll+rNVwxxaFSA/lgqCD13I31odudlZpaXgalH2RAeMyOIXGsm5+7m6BDejjBtOnIj
	C60C01bVqSdsp0Fb0zcQaNomo1A1AjraXpvPSzE7VzXWiyqbrd+T2AmlqD+rIGbfRVXnpGoMz9h
	QKGC+no43qQBZpy37sZIx9esnh8xM0VHCQFDoEmL9ZTAZsXdAgEQ7OUVUC2IRugssDXon4DGdcC
	NaEZBSvDxg9LyAYpr4EQmMpbQUkP8DlRrPfjv45NVC7RUltDwMh8niAfc3U+FXuzFo3D5lDXZuO
	KWOJo1bwR3iK6h/kyEe4QP+oybfIB0+guFtFwnAECRtWJVWxMC7qBIPxTtIjQQMjKtrlytpatKz
	VlCGQAVfmCSMUL2h/XfPCK30jsztDbWBn8D/moFroPSQSNUb62og==
X-Received: by 2002:a17:907:c389:b0:c12:5d9b:6956 with SMTP id a640c23a62f3a-c1287024e59mr134688066b.9.1782814730411;
        Tue, 30 Jun 2026 03:18:50 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm99492566b.61.2026.06.30.03.18.48
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:18:49 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso4132726a12.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 03:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvcM8KoBpxACrylCOsZwjXt1Zq2HgUhHH7jIjjWo/2j6VvSFMaE9MQDaWNdCFDt3N/v1mtEcAqbRJECHXW@lists.infradead.org
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292708a12.21.1782814728107; Tue, 30 Jun 2026
 03:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
X-Gm-Features: AVVi8CfDZI-66BCdudtb8k9h_4xIWUPsPqj5BKaSPsoCDQPTdsJgDTc_K9d7_9w
Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_031852_580361_FAA1DFA9 
X-CRM114-Status: GOOD (  30.19  )
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

SGkgQmFydG9zeiwKCk9uIE1vbiwgMjkgSnVuIDIwMjYgYXQgMTg6NTQsIEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjksIDIwMjYgYXQg
NDo1OOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+ID4gT24gTW9uLCAyOSBKdW4gMjAyNiBhdCAxNjowNywgQmFydG9zeiBHb2xhc3pld3NraSA8
YnJnbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24gTW9uLCAyOSBKdW4gMjAyNiAxNTo1MToz
MSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuCj4gPiA+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
c2FpZDoKPiA+ID4gPiBPbiBNb24sIDI5IEp1biAyMDI2IGF0IDEzOjI5LCBCYXJ0b3N6IEdvbGFz
emV3c2tpCj4gPiA+ID4gPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4+IERlc2NyaWJlIHRoZSBTR01JSS9TZXJEZXMgUEhZIHByZXNlbnQgb24gdGhl
IFF1YWxjb21tIHNhODI1NXAgcGxhdGZvcm1zLgo+ID4gPiA+PiBUaGlzIGlzIGVzc2VudGlhbGx5
IHRoZSBzYW1lIGhhcmR3YXJlIGFzIHNhODc3NXAgcmV2MyBidXQgdGhlIFBIWSBpcwo+ID4gPiA+
PiBtYW5hZ2VkIGJ5IGZpcm13YXJlIG92ZXIgU0NNSS4KPiA+ID4gPgo+ID4gPiA+IFNvIHdoeSBj
YW4ndCBpdCBiZSByZXVzZSB0aGUgRFQgYmluZGluZ3MsIGFuZCBiZSBjb21wYXRpYmxlIHdpdGgK
PiA+ID4gPiBxY29tLHNhODc3NXAtZHdtYWMtc2dtaWktcGh5Pwo+ID4gPiA+Cj4gPiA+ID4+IFNp
Z25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3Nz
LnF1YWxjb21tLmNvbT4KPiA+ID4gPgo+ID4gPiA+PiAtLS0gL2Rldi9udWxsCj4gPiA+ID4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcWNvbSxzYTgyNTVwLWR3
bWFjLXNnbWlpLXBoeS55YW1sCj4gPiA+ID4KPiA+ID4gPj4gKyAgcG93ZXItZG9tYWluczoKPiA+
ID4gPj4gKyAgICBtYXhJdGVtczogMQo+ID4gPiA+PiArCj4gPiA+ID4+ICsgIHBvd2VyLWRvbWFp
bi1uYW1lczoKPiA+ID4gPj4gKyAgICBpdGVtczoKPiA+ID4gPj4gKyAgICAgIC0gY29uc3Q6IHNl
cmRlcwo+ID4gPiA+Cj4gPiA+ID4+ICtleGFtcGxlczoKPiA+ID4gPj4gKyAgLSB8Cj4gPiA+ID4+
ICsgICAgcGh5QDg5MDEwMDAgewo+ID4gPiA+PiArICAgICAgICBjb21wYXRpYmxlID0gInFjb20s
c2E4MjU1cC1kd21hYy1zZ21paS1waHkiOwo+ID4gPiA+PiArICAgICAgICByZWcgPSA8MHgwODkw
MTAwMCAweGUxMD47Cj4gPiA+ID4+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MD47Cj4gPiA+ID4+
ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjbWk3X2R2ZnMgMD47Cj4gPiA+ID4+ICsgICAg
ICAgIHBvd2VyLWRvbWFpbi1uYW1lcyA9ICJzZXJkZXMiOwo+ID4gPiA+Cj4gPiA+ID4gQWgsIHRo
aXMgdXNlcyBwb3dlci1kb21haW5zLCB3aGlsZSB0aGUgZXhpc3RpbmcgYmluZGluZ3MgZm9yCj4g
PiA+ID4gcWNvbSxzYTg3NzVwLWR3bWFjLXNnbWlpLXBoeSB1c2UgYSBjbG9jay4KPiA+ID4gPiBJ
IGd1ZXNzIHRoZSBjbG9jayBpcyB0aGUgY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbj8KPiA+
ID4gPgo+ID4gPiA+IEFkZGluZyB0byBteSBsaXN0IG9mIGV4YW1wbGVzIGZvciBiYWNraW5nIGEg
aGFyZHdhcmUtdG8tU0NNSSByZW1hcHBpbmcKPiA+ID4gPiBkcml2ZXIuLi4KPiA+ID4gPgo+ID4g
Pgo+ID4gPiBSdXNzZWxsIEtpbmcgYXNrZWQgbWUgdG8gcHV0IHRoZSBQSFkgbG9naWMgZm9yIFND
TUkgcG0gZG9tYWlucyBpbnRvIHRoZSBQSFkKPiA+ID4gZHJpdmVyIGluc3RlYWQgb2YgdGhlIE1B
QyBkcml2ZXIgd2hlcmUgaXQgd2FzIHByZXZpb3VzbHkuIEluc3RlYWQgb2YgY3JhbW1pbmcKPiA+
ID4gYm90aCBITE9TIGFuZCBmaXJtd2FyZSBoYW5kbGluZyBpbnRvIHRoZSBzYW1lIGRyaXZlciwg
SSBmaWd1cmVkIGl0IG1ha2VzIG1vcmUKPiA+ID4gc2Vuc2UgdG8gaGF2ZSBhIGRlZGljYXRlZCwg
Y2xlYW5lciBkcml2ZXIgYXMgdGhlIHR3byBzaGFyZSB2ZXJ5IGxpdHRsZSBjb2RlIChpZgo+ID4g
PiBhbnkpLgo+ID4KPiA+IEkgdGhpbmsgeW91IGFyZSBtaXhpbmcgdXAgRFQgYmluZGluZ3MgYW5k
IGRyaXZlciBpbXBsZW1lbnRhdGlvbj8KPgo+IEFoIGluZGVlZCwgYnV0IHRoZSBiaW5kaW5ncyBk
b24ndCBzaGFyZSBhIGxvdCBvZiBjb250ZW50IGVpdGhlci4KClRoYXQncyB0aGUgKG1haW50ZW5h
bmNlKSBwcm9ibGVtOiBpdCBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBoYXJkd2FyZSwKYnV0IHRo
ZSBEVCBiaW5kaW5ncyAoYW5kIGRyaXZlcikgYXJlIGRpZmZlcmVudC4gRG9lcyB0aGlzIHNjYWxl
PwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
