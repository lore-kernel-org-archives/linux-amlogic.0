Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB26CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjHRgo3y/XFW6dTAZh422saLdaC3aB6F5Ubl1PIbw2I=; b=wE8+y7My06sFyo
	EUvFYzX6BayeauUli0848PLfNni1Czse7i6vQc0FhV6bd7zXRpGjsSkMzuYHIWjmW5GecILiCINQ4
	yj9s9jkZPWOQsaAetsRRukotg+J7V/x3sTKSV+ZVz4RZajGCr0vX7U2SJnLbx9gztqHGljk6//5lC
	P+cfy7e/omGtwFuz7sYkmSqRWIGvvRrsx0Z9oshZBZ8NgrPZ4MoM48hsJjKKpfsSJrOsQPUgLgQgK
	GsQFZh3XdV1hUXUYPpyTb2E9RvlstVQ9yohVyeps0dfHUlG/NgTw1cuThx8vM9D+pTuCo/SIKMezf
	zpbwIO2viK0zkF/ITOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfV-00000008M3Q-24XW;
	Mon, 25 Aug 2025 14:59:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWlv-000000081D6-46Vm;
	Mon, 25 Aug 2025 12:58:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7a3a085so682241666b.2;
        Mon, 25 Aug 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756126682; x=1756731482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OarwR/ERDNc0Ml+9OWlKLdmjV+iAjoP8ec7vM3/HCIc=;
        b=d5KA12bmdj3AI50dUaoWdArcfYWxKFM4fFD1GSO7+ec6KwjlKyhNtDPF0DTvws0MCU
         oVBaC6t6DYjaIOZEkMlaB72PShbKq7G/WwMbDe2hYAO9BIK0NFHpMztJ2Uo2gUn8XRR7
         IgmEAv0aKtjD+lFO4cThHvbGHllCUBxGzHSpdcuS22MpG76Y2Ukjnt1irHK+/PWHcdqe
         EQv9QZD1OK+AuH0NnqFWWRG+vaXiqI0/6AxwtUa8F1QV7hpsF30G8PkVjK6Utvxo5fGP
         T+SwS5GXG3IPiQssTj78aZ9LA+S9NjL9CuKkLVYuk1sbpyIcHBGrzIk0ZJGZjJBhO30V
         N8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126682; x=1756731482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OarwR/ERDNc0Ml+9OWlKLdmjV+iAjoP8ec7vM3/HCIc=;
        b=YMWkD/0ug8r+1gQYViLyHH5BPZKrPsuaW/i3PYLjxkyuR0OtFzWrCbAZMksCffCckv
         rRaCIYiSzlH2tGcQ6klfMH9RMWLcD3ig6se0TE3m1PGiZGBHMA/KoDacTj9telBj/88T
         RIcJuAeME2phvHZrfsTxl/e/OGx3rDTSLP+lJu5fO4rVTx8CRRNCJvHShPqw5sQi+VzL
         zx5Dy4JOdObTp+p1mWkGE/Yt+8eT8P2TnIYLNp1X9B3P7WBVmCCNsPaMBH9fmHifEUnt
         tpmNqraVbJ81MPO/p8VhMnlKSvlWkp4fqss7ws/sr1e32QoQwtnTuEALA6tX0zyGBCVZ
         lOOg==
X-Forwarded-Encrypted: i=1; AJvYcCVc8zgnLj4ExGBozYk5yE+1MgjEq9vov3ATJmfIuDlGo3nTaRuCAYdx6f3PHxvpJgBhqv0F0/pwQoEKtL4T7nzfLQ==@lists.infradead.org, AJvYcCWlpbEFneKFsXhVzNOT3OgvuBxTBjIwbI3f+fdOXs/jFHeFgj1VUZxk3dZDA7XZzOt0I3OTDJXdpXENPPBA@lists.infradead.org
X-Gm-Message-State: AOJu0YwU9eGK4t3U8Xjqw9e06vJ/S0/AcG6jPz3USlE0mgaKCQs819SM
	dEgrNDLAsVnKmFQ9qQBcwvQatFPQ2DOLLJc98R2GPphHasGmnQSBdDgZjG0Qk2FOYE0M5NRui0T
	9WZ0+cLS+9TEWOO4qLLFMB0OUkEeigLw8o89I
X-Gm-Gg: ASbGncsjWYyPlmYzEn2njqHVxLWuYxNxbbxHDNjUFCTRx1f6T/jeL7WkgvYcZPpeu/2
	1+3Gg1fvIOv/yjjt0esvgPE858Wdf4cpAJ5W66C+HfIRvr/zsgF/It8/ua1AwL6oNbOjEmQBTf9
	OjJsqYf2vslVs0sXMtWqHhkfthqAAY2e69iAioK8BYl3RHIW8VFSxFYqAZ/5HRqu5raPsOmxfH1
	S25MA==
X-Google-Smtp-Source: AGHT+IHaOgzAzLmJeyLPt5DqrZUSYGHwc/5ongY9XyH18a2Jkpiqoy7KErW13Szg0Ppe2orviqO2JQkWL38+o+volS0=
X-Received: by 2002:a17:907:3e1c:b0:ae0:d4b1:b5f0 with SMTP id
 a640c23a62f3a-afe29548f25mr992674266b.35.1756126682080; Mon, 25 Aug 2025
 05:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250825065240.22577-1-linux.amoon@gmail.com> <20250825065240.22577-2-linux.amoon@gmail.com>
 <19AB5D06-DEB6-4C38-B90D-FCDD9719312C@hewittfamily.org.uk>
In-Reply-To: <19AB5D06-DEB6-4C38-B90D-FCDD9719312C@hewittfamily.org.uk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 25 Aug 2025 18:27:44 +0530
X-Gm-Features: Ac12FXwRodlBz_UjLLJd6RTuYXAAOzs3SHAzCQ_66M5mw-OW-pZnPXMBgXjfwxw
Message-ID: <CANAwSgQT7Y9_TKsYVignTOX1AWpcK6xEEU5+Dhy6Yd=ZG4qCjw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: dts: amlogic: Add cache information to
 the Amlogic GXBB and GXL SoC
To: Christian Hewitt <christian@hewittfamily.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055804_016982_DCB86AFA 
X-CRM114-Status: GOOD (  16.44  )
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

SGkgQ2hyaXN0aWFuLAoKT24gTW9uLCAyNSBBdWcgMjAyNSBhdCAxMzoyOSwgQ2hyaXN0aWFuIEhl
d2l0dAo8Y2hyaXN0aWFuQGhld2l0dGZhbWlseS5vcmcudWs+IHdyb3RlOgo+Cj4gPiBPbiAyNSBB
dWcgMjAyNSwgYXQgMTA6NTHigK9hbSwgQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBBcyBwZXIgUzkwNSBhbmQgUzkwNVggZGF0YXNoZWV0IGFkZCBtaXNz
aW5nIGNhY2hlIGluZm9ybWF0aW9uIHRvCj4gPiB0aGUgQW1sb2dpYyBHWEJCIGFuZCBHWEwgU29D
Lgo+ID4KPiA+IC0gRWFjaCBDb3J0ZXgtQTUzIGNvcmUgaGFzIDMyS0Igb2YgTDEgaW5zdHJ1Y3Rp
b24gY2FjaGUgYXZhaWxhYmxlIGFuZAo+ID4gMzJLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJs
ZS4KPiA+IC0gQWxvbmcgd2l0aCA1MTJLQiBVbmlmaWVkIEwyIGNhY2hlLgo+ID4KPiA+IENhY2hl
IG1lbW9yeSBzaWduaWZpY2FudGx5IHJlZHVjZXMgdGhlIHRpbWUgaXQgdGFrZXMgZm9yIHRoZSBD
UFUKPiA+IHRvIGFjY2VzcyBkYXRhIGFuZCBpbnN0cnVjdGlvbnMsIGxlYWRpbmcgdG8gZmFzdGVy
IHByb2dyYW0gZXhlY3V0aW9uCj4gPiBhbmQgb3ZlcmFsbCBzeXN0ZW0gcmVzcG9uc2l2ZW5lc3Mu
Cj4KPiBIZWxsbyBBbmFuZCwKPgo+IEnigJltIHdvbmRlcmluZyBpZiB3ZSBhcmUg4oCcZW5hYmxp
bmcgY2FjaGluZ+KAnSBpbiB0aGVzZSBwYXRjaGVzIChjb3VsZCBiZQo+IGEgc2lnbmlmaWNhbnQg
Z2FpbiwgYXMgcGVyIHRleHQpIG9yIHdlIGFyZSDigJxvcHRpbWlzaW5nIGNhY2hpbmfigJ0gbWVh
bmluZwo+IHRoZSBrZXJuZWwgY3VycmVudGx5IGFzc3VtZXMgZ2VuZXJpYy9zYWZlIGRlZmF1bHRz
IHNvIGhhdmluZyBhY2N1cmF0ZQo+IGRlc2NyaXB0aW9ucyBpbiBkdCBhbGxvd3MgYmV0dGVyIGVm
ZmljaWVuY3kgKG1hcmdpbmFsIGdhaW4pPwo+Cj4gU3RhdHMgYXJlIGFsc28gc3ViamVjdGl2ZSB0
byB0aGUgd29ya2xvYWQgdXNlZCwgYnV0IGRvIHlvdSBoYXZlIGFueQo+IGtpbmQgb2YgYmVmb3Jl
L2FmdGVyIGJlbmNobWFya3M/IChmb3IgYW55IG9mIHRoZSBTb0NzIGluIHRoZSBwYXRjaHNldCkK
PgoKVGhpcyBpcyBhIGZ1bmRhbWVudGFsIGZlYXR1cmUgb2YgQXJtNjQgQ1BVcyB0aGF0IHRyYWNr
cyBhY3RpdmUgaW5zdHJ1Y3Rpb25zCmFuZCBkYXRhIHdpdGhpbiBjYWNoZS1tYXBwZWQgbWVtb3J5
IHBhZ2VzLgpFbmFibGluZyBpdCBjYW4gc2lnbmlmaWNhbnRseSBlbmhhbmNlIG92ZXJhbGwgc3lz
dGVtIHBlcmZvcm1hbmNlLgoKV2UgY2FuIGNvbmZpZ3VyZSBtb3JlIGwyIGNhY2hlIG1lbW9yeSB3
aGljaCBpcyBjb25mcmliYWJsZSBhcyBwZXIgdGhlCkFybSBUUk0gZG9jdW1lbnQuCkFybSBDb3J0
ZXggLSBBNTMgIC0gQ29uZmlndXJhYmxlIEwyIGNhY2hlIHNpemUgb2YgMTI4S0IsIDI1NktCLCA1
MTJLQiwKMU1CIGFuZCAyTUIuCkFybSBDb3J0ZXggLSBBNTUgIC0gQ29uZmlndXJhYmxlIEwyIGNh
Y2hlIHNpemUgb2YgNjRLQiwgMTI4S0IsIG9yIDI1NktCCkFybSBDb3J0ZXggLSBBNzMgLSAgQ29u
ZmlndXJhYmxlIEwyIGNhY2hlIHNpemUgb2YgMjU2S0IsIDUxMktCLCAxTUIsCjJNQiwgNE1CLCBv
ciA4TUIuCgpIZXJlJ3MgYW4gYXJ0aWNsZSB0aGF0IHByb3ZpZGVzIGRldGFpbGVkIGluc2lnaHRz
IGludG8gdGhlIGNhY2hlIGZlYXR1cmUuClswXSBodHRwOi8vamFrZS5kb3Rob21lLmNvLmtyL2Nh
Y2hlNC8KCkkgdGVzdGVkIHdpdGggYSBzbWFsbCBiZW5jaG1hcmsgdG8gdGVzdCBmYWN0b3JpYWwu
CgpCZWZvcmU6PgphbGFybUBhcmNobC1saWJyZWNtOn4kIHN1ZG8gcGVyZiBzdGF0IC1lIGNhY2hl
LXJlZmVyZW5jZXMsY2FjaGUtbWlzc2VzIC4vdGVzdApTaW11bGF0ZWQgQ2FjaGUgTWlzcyBUaW1l
IChhdmcpOiA1ODkgbnMKRmFjdG9yaWFsKDEwKSA9IDM2Mjg4MDAKCiBQZXJmb3JtYW5jZSBjb3Vu
dGVyIHN0YXRzIGZvciAnLi90ZXN0JzoKCiAgICAgICAgICAgMzAxNzI4NiAgICAgIGNhY2hlLXJl
ZmVyZW5jZXMKICAgICAgICAgICAgIDQ1NDE0ICAgICAgY2FjaGUtbWlzc2VzICAgICAgICAgICAg
ICAgICAgICAgIyAgICAxLjUxJSBvZgphbGwgY2FjaGUgcmVmcwoKICAgICAgIDAuMDU0NTEyMzk0
IHNlY29uZHMgdGltZSBlbGFwc2VkCgogICAgICAgMC4wMDQyMDkwMDAgc2Vjb25kcyB1c2VyCiAg
ICAgICAwLjA0MTg2NjAwMCBzZWNvbmRzIHN5cwoKQWZ0ZXI6PgogIyBzdWRvIHBlcmYgc3RhdCAt
ZSBjYWNoZS1yZWZlcmVuY2VzLGNhY2hlLW1pc3NlcyAuL3Rlc3QKU2ltdWxhdGVkIENhY2hlIE1p
c3MgVGltZSAoYXZnKTogNDI2IG5zCkZhY3RvcmlhbCgxMCkgPSAzNjI4ODAwCgogUGVyZm9ybWFu
Y2UgY291bnRlciBzdGF0cyBmb3IgJy4vdGVzdCc6CgogICAgICAgICAgIDI4MTQ2MzMgICAgICBj
YWNoZS1yZWZlcmVuY2VzCiAgICAgICAgICAgICAyNzA1NCAgICAgIGNhY2hlLW1pc3NlcyAgICAg
ICAgICAgICAgICAgICAgICMgICAgMC45NiUgb2YKYWxsIGNhY2hlIHJlZnMKCiAgICAgICAwLjA0
MTA0MTU4NSBzZWNvbmRzIHRpbWUgZWxhcHNlZAoKICAgICAgIDAuMDA3OTc2MDAwIHNlY29uZHMg
dXNlcgogICAgICAgMC4wMzIwMDkwMDAgc2Vjb25kcyBzeXMKCj4gQ2hyaXN0aWFuCgpUaGFua3MK
LUFuYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
