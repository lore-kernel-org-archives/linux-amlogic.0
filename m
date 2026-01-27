Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55211CA6CB8
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fc2ZDg1+Ss/pL07Qv5Sw6ET3GoKKGlk+pdPIX9uwK9Y=; b=Ep7XhSwF1PhOCh
	OdFHP04kbzeSFH1UOPyQTkJd2Jw0F6H3JFFNDOYNoP5AOJkL1ZGibWE6rY2qHuY3v475ME2CjuPUX
	6sTz8y70JSmQ9bA1OHxcM+XVriRQEl5a3T6zAao8bEaY4xUwf8ShpxhnFJVImHJapzxSnZWtiHJp3
	CYy9r+srHBAynRniD9oi2v3R0rFNh76Vk5zJFmmvZqKPgYdtPd3ovrKEqJvHHZFnxEyT0fxOIB41p
	aix3ObccADrsbjzKp4Mh3xmt68wN2D6lTRYcCrPAog2zfihwRU6EHLzBR6RYfYaw+eraBdFpdMy6O
	NHmHKkJYUGq4T/871Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFJ-0000000DvFk-1rmC;
	Tue, 27 Jan 2026 09:20:25 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfFF-0000000DvF2-3HjR
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 09:20:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b885d8f4092so732161766b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769505619; x=1770110419; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=kc6tjSVzqE+GtBijOtoVZkME+gHP2Ifb+D7l0hIQhOVH1ZoYInC942y+kF9rnK8JDY
         DBUxtaSGccaE1XqJC5giJAICkn0q9ZlSH1YBIVkvanl6MOZ3r7nMQQDCcpszp69LKp6E
         HZ5zImiUSIB98tba5hlcQ860ThkRRKpmjw0zUMk3/3UZ62MAaCVhU6U3XybwTjXVKoOn
         e/ovG2kPGd266HyQqH2JcZaXT+a3NTiWQUme3BuOyu+dNTGI+ixZtC90rKMQ89HDh669
         PPWqhaY/QorwwvuUNB2zcyq+dB0gOcRfnan+x0vJCxUz+18uTAagik4zVkyT5IxO2f2+
         vPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505619; x=1770110419;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRaJIBsOgwkV+eg1RM+W3L4+CnbMHXTkmYHk3spsKPM=;
        b=vXAiTOLdyA0Yocd8Dncoxp4cPcHltrEe4q6qEjk9zvxyarrNmQ2CD4sqvUr1khhFGa
         6YXqTzdYXfCUA6YNaUGty34ar+3kN80W48QGdix0/ttT9TDhwWgy1ehZQ/SAw+VmWiAn
         NJjuQ5VfwYgtUnZXnbSsT+8MakS5kjbqyYCRYIEUocw72s7BCGE4WvsUUG52IcmQKADv
         8pMrKRkxnMhtUx+3iG0xziuwj+FW8uzIutUosCcvLTT2CTP2POa9zGsOeS5JTRR7OPQJ
         wUWR+eG8ISvzzB81VwKRcNOMiBa1UKi+HZdaH1nl4xKG9gmNYl5kuPWC0cSLFflfdxoa
         tlsA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Rk6iqHNSsCIc8F77HmhZkTMlodRYKC4q5dd9sD20Fz5E3M9HF4tx+I71F7wm2pP+CWBrTf8JTzg5BiAw@lists.infradead.org
X-Gm-Message-State: AOJu0YwiN8EhsKSeUx9xAA6AMFiQeete6AAbdyUV5ceiwbKl5syt/MTI
	xJm5ZNTKVRRyNJMrKsg237K+ZCLBAr8UCquetSj56pvqAYDwy3S/d7tK
X-Gm-Gg: AZuq6aIkmmY+5ERp/gKsyruRMPARbBlf4QjPyWV7OLf1QwG/whIzMyPP31kYNyEFiZ4
	jBEz/btKOXOvWrzODzODQwxFbjelpnaLlZ7cb5RDxrxPmCEFlzXhk4gIo9xEpT9jAULXm0zfCj4
	QvcSYmnU6yLj2/FY2s2u3GuFptMAnTQdnmDpRyug7oxF3j84888YgxFP0q89Tn4n2dOkI1fETi3
	Hm2nPHKSm+u8Zg86mXPpQReGZvaPETSkjrnMbvCCYsIWhK2Kf8nmPvX8w5K+O6mysIs60Rd3OwJ
	G3ggvZqGstZAOLNMgyls5quUAhGsC0DMfFvXiK6UHd9UnkwqExs7bTmL3gO47bTEoNXnLQwh6HC
	VTXF50cIIpdjnu2NIIKTIzRQdt9i/09xQHzR2RhvZdipGRgVmxezHMK26n5w6zA5p+Uw8iHt03L
	twDVD4vW1CBKZGgnBCK6N6R4TtyD3wsNpzItf4Bk1jIUFY5AN4SSGULfZ5cYXW92Ug
X-Received: by 2002:a17:907:7287:b0:b88:5b35:914b with SMTP id a640c23a62f3a-b8dab3d056bmr95912366b.59.1769505619057;
        Tue, 27 Jan 2026 01:20:19 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b700d43sm776257066b.41.2026.01.27.01.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:20:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH v6 0/5] Add support for S4 audio
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Date: Tue, 27 Jan 2026 10:20:03 +0100
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 jian.xu@amlogic.com,
 shuai.li@amlogic.com,
 zhe.wang@amlogic.com
Message-Id: <35CAE0E9-4C3F-4B41-BA1A-19761671F392@gmail.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
To: jiebing.chen@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_012021_870197_CCF130C9 
X-CRM114-Status: GOOD (  12.11  )
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

Cgo+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IEppZWJpbmcgQ2hlbiB2aWEgQjQgUmVsYXkg
PGRldm51bGwramllYmluZy5jaGVuLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHcgZG5pdSAyNiBz
dHkgMjAyNiwgbyBnb2R6LiAwNzowMToKPiAKPiBUaGlzIHNlcmllcyBjb21wbGV0ZXMgdGhlIGVu
ZC10by1lbmQgYXVkaW8gc3VwcG9ydAo+IGZvciBTNCBTb0MgZnJvbSBoYXJkd2FyZSBiaW5kaW5n
cyB0byBkcml2ZXIgaW1wbGVtZW50YXRpb24KPiBhbmQgc3lzdGVtIGludGVncmF0aW9uLgo+IAo+
IDEgRGV2aWNlIFRyZWUgQmluZGluZ3MgVXBkYXRlcyAKPiBBZGRlZCBhdWRpbyBwb3dlciBkb21h
aW4gYW5kIFM0IGF1ZGlvIGNsb2NrIHN1cHBvcnQgZm9yIFM0IFNvQy4KPiBBZGRlZCBTNCBhdWRp
byB0b2NvZGVjIGJpbmRpbmcgc3VwcG9ydC4KPiAKPiAyIERyaXZlciBJbXBsZW1lbnRhdGlvbgo+
IEltcGxlbWVudGVkIFM0IHRvY29kZWMgZHJpdmVyIGZvciBHMTJBIGFyY2hpdGVjdHVyZS4KPiBB
ZGRlZCBTNCBhdWRpbyBjbG9jayBzdXBwb3J0IGluIEFYRyBhdWRpbyBjbG9jayAKPiAKPiAzIERl
dmljZSBUcmVlIEludGVncmF0aW9uCj4gQWRkIEFtbG9naWMgUzQgYXVkaW8gc3Vic3lzdGVtIHN1
cHBvcnQgaW4gYXJtNjQgRFRTLgo+IAo+IFNpZ25lZC1vZmYtYnk6IGppZWJpbmcgY2hlbiA8amll
YmluZy5jaGVuQGFtbG9naWMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjY6Cj4gLSBGaXggdGhl
IHByb2JsZW0gb2Ygc3RyaW5nIGZvciBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxheGctYXVkaW8tY2xrYy55YW1sCj4gLSBSZW1vdmUgY2xvY2sgcGFkIHJl
Z2lzdGVyLCBhbmQgaXQgd2lsbCBiZSBzdWJtaXR0ZWQgYXMgYW4gaW5kZXBlbmRlbnQgcGF0Y2gu
Cj4gLSBSZWRlc2NyaWJlIHNvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMKPiAtIExpbmsg
dG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA3MTAtYXVkaW9fZHJ2aWVyLXY1
LTAtZDQxNTVmMWU3NDY0QGFtbG9naWMuY29tCj4gCgpKaWViaW5nLAoKRllJCgpJIGFwcGxpZWQg
dGhpcyBzZXJpZXMgb3ZlciA2LjE4LjcgYW5kIHRlc3RlZCBvbiBzOTA1dzIgZGV2aWNlLgoKV2l0
aCBhdWRpbyByb3V0aW5nIGxpa2UgdGhpczoKCmFtaXhlciBjc2V0IG51bWlkPTQwLGlmYWNlPU1J
WEVSLG5hbWU9J0ZSRERSX0EgU0lOSyAxIFNFTCcgMAphbWl4ZXIgY3NldCBudW1pZD03MyxpZmFj
ZT1NSVhFUixuYW1lPSdURE1PVVRfQSBTUkMgU0VMJyAwCmFtaXhlciBjc2V0IG51bWlkPTM3LGlm
YWNlPU1JWEVSLG5hbWU9J0ZSRERSX0EgU1JDIDEgRU4gU3dpdGNoJyAxCmFtaXhlciBjc2V0IG51
bWlkPTYxLGlmYWNlPU1JWEVSLG5hbWU9J1RPQUNPREVDIFNSQycgMAphbWl4ZXIgY3NldCBudW1p
ZD0xLGlmYWNlPU1JWEVSLG5hbWU9J1RPQUNPREVDIExhbmUgU2VsZWN0JyAwCmFtaXhlciBjc2V0
IG51bWlkPTYyLGlmYWNlPU1JWEVSLG5hbWU9J1RPQUNPREVDIE9VVCBFTiBTd2l0Y2gnIDEKYW1p
eGVyIGNzZXQgbnVtaWQ9MTcsaWZhY2U9TUlYRVIsbmFtZT0nQUNPREVDIFBsYXliYWNrIFZvbHVt
ZScgMjUxIDI1MQoKaSdtIGdldHRpbmcgd29ya2luZyBhdWRpbyBvbiBhbmFsb2cgaGVhZHNldC4K
CkdyZWF0IHdvcmshCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
