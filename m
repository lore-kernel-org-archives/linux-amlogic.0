Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE290C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEb827rGkdDikcqOs2HpIFtAM21KgLq1EbLtiqyuJ3g=; b=uudFP5Dh+9gQVZ
	23UpBxAcJflnHnEiGEoxul3noTM3hPUob+cXU+aTIQDGExtHKz6lfCw8yYCzr+djo9y2akTSF6ahQ
	SNVmCpNn8uU+0xsr7tI+5COn6lj++Rrjh0VYlel9JsZK5IYtTutggOZb+V+PEO0PN869jEtsnIiRT
	CoUlGtD0EmK/e8oiVNh8cwwYI9dqohVI7MLMSYFI5fnxDW3sbOpS6amCuRllBbEDKxbniPlzMW3yO
	z4f1zP5oceaNYEc5PXZR39vVQbNn3niRY9zsYmVjtdtVn2EDg1S2NU+NycL33dMZn3c+vGJhd2RjS
	kFNMeI/CJ9MMlKdsoPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tup72-00000008OOG-23Yp;
	Wed, 19 Mar 2025 08:49:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tup70-00000008ONU-0149;
	Wed, 19 Mar 2025 08:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85175A48B20;
	Wed, 19 Mar 2025 08:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19523C4CEEE;
	Wed, 19 Mar 2025 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742374156;
	bh=Pc7OmAP3/6l/+cxajU8JvnMaWhla1SM9/gpPoX+sfco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbX6Gb+Tvc18mdaUN9Dv0/p1p67bkNJmde/JkHRT47eo8FfBRYcvodDiB98XkoQKm
	 eDegnXfrMmMbCMxzScBI1s0PTSPxkmruJfNrU4H5aKI5Dxa5aIXJDlYAiVPOEESodU
	 Tnc2wjZrDXs7IAjJLg2cUC9zT4H7Wag7cMq607c2danXI1rOivcKzfSrJiM/cw9VgS
	 SLX/HnGK6Wn4i/7Hp4Wy3VF+ZoBjgCSlIBbIWF9pfyy1mrRDWfui+8NlMBAi51kjIM
	 bH+4wbHlNZKdIixqVdUiq94zui3vjtRUvynFirr+X3ylnUAIxyJCmLfFBqxbksGYwu
	 DyNeaaJmvqyxg==
Message-ID: <7bb26735-bd68-426a-ab0e-ec8379b39bdf@kernel.org>
Date: Wed, 19 Mar 2025 09:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: amlogic: Add Amlogic S4 Audio
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-6-686867fad719@amlogic.com>
 <20250319-quizzical-coyote-of-assurance-d4c91d@krzk-bin>
 <6c1ca29e-37e4-488c-b3a3-f61aad7f8dcf@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <6c1ca29e-37e4-488c-b3a3-f61aad7f8dcf@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_014918_174982_896DB6EF 
X-CRM114-Status: GOOD (  14.39  )
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

T24gMTkvMDMvMjAyNSAwOTo0NiwgSmllYmluZyBDaGVuIHdyb3RlOgo+Pj4gKyAgICAgdGRtaWZf
YjogYXVkaW8tY29udHJvbGxlci0xIHsKPj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
bWxvZ2ljLGF4Zy10ZG0taWZhY2UiOwo+Pj4gKyAgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxz
ID0gPDA+Owo+Pj4gKyAgICAgICAgICAgICBzb3VuZC1uYW1lLXByZWZpeCA9ICJURE1fQiI7Cj4+
PiArICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0FfU0NM
Sz4sCj4+PiArICAgICAgICAgICAgICAgICAgICAgIDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNU
X0JfTFJDTEs+LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICA8JmNsa2NfYXVkaW8gQVVEX0NM
S0lEX01TVF9CX01DTEs+Owo+Pj4gKyAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJzY2xrIiwg
ImxyY2xrIiwibWNsayI7Cj4+PiArICAgICB9Owo+Pj4gKwo+Pj4gKyAgICAgdGRtaWZfYzogYXVk
aW8tY29udHJvbGxlci0yIHsKPj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LGF4Zy10ZG0taWZhY2UiOwo+Pj4gKyAgICAgICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+
Owo+Pj4gKyAgICAgICAgICAgICBzb3VuZC1uYW1lLXByZWZpeCA9ICJURE1fQyI7Cj4+PiArICAg
ICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0NfU0NMSz4sCj4+
PiArICAgICAgICAgICAgICAgICAgICAgIDwmY2xrY19hdWRpbyBBVURfQ0xLSURfTVNUX0NfTFJD
TEs+LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICA8JmNsa2NfYXVkaW8gQVVEX0NMS0lEX01T
VF9DX01DTEs+Owo+Pj4gKyAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJzY2xrIiwgImxyY2xr
IiwibWNsayI7Cj4+PiArICAgICB9Owo+Pj4gKwo+Pj4gICAgICAgIHRpbWVyIHsKPj4+ICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGFybXY4LXRpbWVyIjsKPj4+ICAgICAgICAgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSAxMyAoR0lDX0NQVV9NQVNLX1NJTVBMRSg0KSB8IElS
UV9UWVBFX0xFVkVMX0xPVyk+LAo+Pj4gQEAgLTEwMSw3ICsxMzUsNiBAQCBhcGI0OiBidXNAZmUw
MDAwMDAgewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwweDAgMHgwIDB4MCAweGZlMDAwMDAwIDB4MCAweDQ4
MDAwMD47Cj4+PiAtCj4+IFdoeT8gV2hhdCBpcyBoYXBwZW5pbmcgaW4gdGhpcyBwYXRjaCAtIHdo
eSBhcmUgeW91IGNoYW5naW5nIHNvIG1hbnkKPj4gb3RoZXIgcGllY2VzPwo+IAo+IEhpLCBLcnp5
c3p0b2YKPiAKPiBmb3IgbGFzdCB2ZXJzaW9ucyAsaXQgaXQgbm90IG1hdGNoIHRoZSBhbWxvZ2lj
LGF4Zy10ZG0taWZhY2UueWFtbAoKSXQgaXMgbm90IHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUuIFJl
YWQgcmVwbGllcyBhbmQgcGF0Y2hlcyBhZ2Fpbi4KCj4gCj4gc28gd2UgbXVzdCBiZSBjaGFuZ2Ug
dGhlIG9yZGVyLCBvdGhlcndpc2UgYSB3YXJuaW5nIHdpbGwgYmUgdGhyb3du77yMd2UgCj4gY29w
eSB0aGUgZHRzIGNvbmZpZyBmcm9tIG1lcmdlZCBkdHMKPiAKPiB0aGUgb2xkIG9yZGVyIG5vdCBt
ZWV0IHRoZSBkdC1iaW5kaW5nIHJ1bGUsIEFub3RoZXIgY2hhbmdlLCB3ZSBvbmx5IGFkZCAKPiB0
aGUgYXVkaW8gY2xvY2sgcmVnCj4gCj4gKyBjb21wYXRpYmxlID0gImFtbG9naWMsczQtYXVkaW8t
Y2xrYyI7ICsgcmVnID0gPDB4MCAweDAgMHgwIDB4ZDg+LAo+IAo+IGFkZCA8MHgwIDB4RTgwIDB4
MCAweDEwPjsKPiAKPiBXZSBoYXZlIG5vdCBtYWRlIGFueSBjaGFuZ2VzIHRvIHRoZSByZXN0CgpI
b3cgaXMgdGhpcyBldmVuIHJlbW90ZWx5IHJlbGF0ZWQgdG8gbXkgY29tbWVudD8KCkl0J3Mgc3Rp
bGwgYSBOQUsgZm9yIHJlYXNvbnMgc3RhdGVkIGxhdGVyIHdoaWNoIHlvdSBkZWNpZGVkIHRvIGln
bm9yZS4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
