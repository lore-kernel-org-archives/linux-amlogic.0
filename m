Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51C1E94615
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 21:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc8RwUI9Uuc4wgwFKBdJbjpLN5wQxMaugw20ByoRAt4=; b=aJLPoedcGLuJg0
	0ZEDtFJNtC96ZX5iiqpFauYgE2ZPjWW2YIkw2TjkCCJlhKSpE2USBwdIxJX/4QaclC/cSEqtkq9u4
	rgkISmgMWEbqgpNTLrxjp5ZMgJqcjOy1WG09heZED1UoseGIIIdaGiy3U4sgUDOMhXXIKwkeT4UPE
	aKWAGbynYEgFXGBpBGZQfJtCab7Nz3leiY+uDoiUyjlWXyDf2Lm++MRMEv33z/7WlDmWG+NIEOmgB
	xskR5JP2fwe6Wwn9SIeLMkTLY31GrzIWhTNMAKofqxGr8+9CXSen43ROdrn2pZ9PRNvr6OhTjvF5o
	d1bflggSbHav/K4+VOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZAV-0000000G4Il-1nbR;
	Mon, 09 Feb 2026 21:51:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZAS-0000000G4II-22fa
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 21:51:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a79ded11a2so872055ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 13:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770673899; cv=none;
        d=google.com; s=arc-20240605;
        b=LeOWKLHKAbuZ355OZk8YBsqBG/fX1uDhA7dgp7D8MvVBw0OZ8WoEYDhy95f9xrR/Lx
         W3SVkO4jG1CPBbkPidVC1x2QzZ4Im28VgL1bxCi6JDN4Rryd0jiqMPTg4aC9nsc6UAQY
         4ZQ0htNC6bZBrl3kzMUZ84bqndRQ4yQ9zliiTNejAyFdgq3fZFq9kHTS5/82j/1IqCVC
         O+lZ+6iBTq2oqQkQwZOFW2mh0mNCcJxlt820pUiKLiLRkqOnEj8C7FzZIbgio3Mfk7Ig
         P4DP2VnehM/w5nLUPyVAtiyrFAj53T8yu4P+eFY/bPIrHH6l4yMJfw/wyy7a4uag5fyZ
         Fw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        fh=8z34gL7XJpeKMlrYQleWKQue5yyj51Oq5LicYNA1q3s=;
        b=lBFk0nJFaVl8Lgp9nwwGJHElqAMTrpXnrgIfBpcI19/ZoyYgi8v7IBroZY+a7FHiFa
         M0jwXRSBrhI753qJcSVltMY67ugEm/0qqN8EOlX4MlEAsC7JyS1Snzjo33uarhkMmzfI
         kNHKJRW/Adr+RYIp6pV2CmbBqPiFuQ3LAWNFjUSMmT8mNTAyuDq4XwxqCzaFm36kc6i0
         ai8ugqSXEIc71NBeqAoygR2s8tdY+OXlmNeWhAX/w9hY74cTO84cbZMqD2h4RuRL63P/
         DOwPQ+rYpx4659OaDPpk6/xkzF1+2PLvCgR/F3qReFAkdVR6fhZ0ayeumlQnDC86IZ3b
         w82w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770673899; x=1771278699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        b=l+AePeDTtpHX4fHM1tP78BBR7xD2dnOWSsi7a3WDyIaQXKAMDAxbsVMGTcsDfpIJZX
         UEQrkDKS2tVOA7dB/mbcfCQ2N3XRVlGGJbBt/XECPRuCeG/7Ag/x9FlDURTReDtIGdwc
         bEIbzBSPBaoJFwxAnETk0b7V37ZwLKSQvY21pDT6PmMjWCGPuwT1MjoeRf3PHbojjvLM
         yr+3WtG6G00txo1Xs4GqJhk+0fwV9U3IxexZlg3drCrdUpprbgrBQVnP+vFgL/m3IOzV
         npe/uHsPNuKMpqZK2E/ZpRg1Y6DJIxDwZTKvh+zEWCcklg+Q7ITc4lF6CtR1ReQ6ziW5
         4B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770673899; x=1771278699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LNSmgkK/Xeb7EzbHB5/P9zJvOA3viMToQ8rWOpp8IyY=;
        b=C1OPmFfG2tAUgV8sLKvWou9g9VWebxbv2sD4M7IrxNZ2aHJqKEj+81NCYnZTmUUW0x
         ZWCxng7VjDpqfUgRofz+2IVzrNr4QYgNALsD+jbwzbxiieV2lpEfpBcQlxvGVFRv9bZX
         zPufgmiMSCoqAWtckdNg7/GRzw5+5P7Z6pvEbRHcazYT5cq9631cZoL1T8A3Oe1Aa1Dq
         dfInwsNXSIht2oM/hCWnN+PbG79ILYsHlhkvS6cwQKLLM7AEmKQ9Pdd18yhyXl06TZqX
         0EBv3sm+/jz5k3mwbO22dIGiAfVOBqcS2fN44S3nZ/UgoRV5iSMwF+6MXsdgnxFdiuKp
         WDOg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZJoFa0v9HM6uM36+8aE6HtqLHFXVclzcXmxQXjsyEB2OiYddulzApmMfgT0h0PGJTQAoPgkXvvtZe5N2@lists.infradead.org
X-Gm-Message-State: AOJu0YzdgvXCc1UQrMYuyW+OsSYl9qaTNcR1xF7LsNqzpPJXWfEONJod
	Y4B0I3mFZIinusguGWyAZLODfJWsGEI+Olfy92nL7PdhOtv9nQtsse50EcCYVR0D9qix/JZ7a+L
	0fg2MDdv31el/gjCjhaj4BwaMLB2Fbgw=
X-Gm-Gg: AZuq6aKhTHPvlTcUVTLhfxoobw/al/GermQWqye5w/d+SINmyL9+TI+Pl2kCuyu739Q
	ZFfgLf9KidT7Jwpz6SH9QLED/OHMtTfR6EroNmFXwzYGh952S5ZhCdq6a03Zsu6QdGeP54TSOQH
	EIN0LbldWPjTzrhcfA75Iab09qfg3sTyFfYQfkh41b6k59wakjSXRY3PzRLBHZczQ4hh/LH9pnS
	0xfRE0bxKzRQ5XIMdBhXKqczCpcpt8AHZDQqntPfYrMDIERkShmQZGMLmt1HPYUTSa8XINXM+yO
	TxZyMGZPzwFG00TDa5mo6jLrtjQw
X-Received: by 2002:a17:902:ce91:b0:2a3:1d78:7505 with SMTP id
 d9443c01a7336-2a951924f55mr125670905ad.56.1770673899458; Mon, 09 Feb 2026
 13:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com> <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
In-Reply-To: <20260209-a9_clock_driver-v1-6-a9198dc03d2a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 22:51:28 +0100
X-Gm-Features: AZwV_Qg1HJR4QgLW0r7lzrQg8qpKm_1pOVerBt-Qr4quSkD9eqYUhMC2xIzMLWk
Message-ID: <CAFBinCBXFxefUkNj3sqUdnTz7vf72jV_FkCP6gd2veTtLHWnBg@mail.gmail.com>
Subject: Re: [PATCH 06/13] clk: amlogic: Add noglitch clock driver
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_135140_530839_AE122592 
X-CRM114-Status: GOOD (  12.08  )
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

SGkgQ2h1YW4gTGl1LAoKT24gTW9uLCBGZWIgOSwgMjAyNiBhdCA2OjQ54oCvQU0gQ2h1YW4gTGl1
IHZpYSBCNCBSZWxheQo8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4g
d3JvdGU6ClsuLi5dCj4gKyAqIFRvIHByZXZlbnQgZ2xpdGNoZXMgZnJvbSBwcm9wYWdhdGluZyB0
byBjbGtfb3V0IGFuZCBhZmZlY3RpbmcgdGhlIG5vcm1hbAo+ICsgKiBvcGVyYXRpb24gb2YgZ2xp
dGNoLXNlbnNpdGl2ZSBtb2R1bGVzLCB0aGUgbm8tZ2xpdGNoIGNsb2NrIG11c3QgYmUgY29uZmln
dXJlZAo+ICsgKiBmb2xsb3dpbmcgdGhlIHNwZWNpZmllZCBzZXF1ZW5jZToKPiArICogICAtIFdo
ZW4gdGhlIGNsb2NrIGdhdGUgaXMgZGlzYWJsZWQ6IGNvbmZpZ3VyZSBpdCBhcyBhIG5vcm1hbCBj
b21wb3NpdGUgY2xvY2sKPiArICogICAgIChhbnkgZ2xpdGNoZXMgZ2VuZXJhdGVkIHdpbGwgYmUg
YmxvY2tlZCBieSB0aGUgZ2F0ZSBhbmQgd2lsbCBub3QKPiArICogICAgIHByb3BhZ2F0ZSB0byBj
bGtfb3V0KS4KVGhpcyBwYXJ0IGlzIGVhc3kgYW5kIG1ha2VzIHNlbnNlLgoKPiArICogICAtIFdo
ZW4gdGhlIGNsb2NrIGdhdGUgaXMgZW5hYmxlZDogY29uZmlndXJlIGl0IGFjY29yZGluZyB0byB0
aGUgZm9sbG93aW5nCj4gKyAqICAgICBzZXF1ZW5jZSB0byBzdXBwcmVzcyBnbGl0Y2hlczoKPiAr
ICogICAgICAgLSBDb25maWd1cmUgYW5kIGVuYWJsZSB0aGUgaWRsZSBjb21wb3NpdGUgY2xvY2sg
cGF0aCBvZiB0aGUKPiArICogICAgICAgICBub2dsaXRjaF9tdXggd2l0aCB0aGUgdGFyZ2V0IGZy
ZXF1ZW5jeS9wYXJlbnQgY2xvY2suCj4gKyAqICAgICAgIC0gU3dpdGNoIHRoZSBub2dsaXRjaF9t
dXggdG8gdGhlIGNoYW5uZWwgcHJlcGFyZWQgaW4gdGhlIHByZXZpb3VzIHN0ZXAuCj4gKyAqICAg
ICAgIC0gRGlzYWJsZSB0aGUgY2xvY2sgb2YgdGhlIG9yaWdpbmFsIG5vZ2xpdGNoX211eCBjaGFu
bmVsLgo+ICsgKi8KRnJvbSBhIHByZXZpb3VzIGRpc2N1c3Npb24gaXQgc2VlbXMgdGhhdCBpbiBy
ZWFsaXR5IHRoaW5ncyBuZWVkIHRvIGJlCmhhbmRsZWQgbW9yZSBjYXJlZnVsbHkgYXMgeW91IHBy
ZXZpb3VzbHkgbWVudGlvbmVkIHRoYXQKQ0xLX1NFVF9SQVRFX0dBVEUgaXMgbm90IGdvb2QgZW5v
dWdoICh0aGUgZGVzY3JpcHRpb24gYWJvdmUgaXMgd2hhdApDTEtfU0VUX1JBVEVfR0FURSBhbHJl
YWR5IGFjaGlldmVzKS4KRm9yIHRoZSBtb3JlIGNhcmVmdWwgaGFuZGxpbmcgSmVyb21lIHN1Z2dl
c3RlZCB1c2luZyB0aGUgY2xvY2sKcHJvdGVjdGlvbiBsb2dpYzogWzBdCllvdSB3YW50ZWQgdG8g
dHJ5IGl0IG91dCBhdCBzb21lIHBvaW50OiBbMV0KSXMgdGhlIHZlcmRpY3QgdGhhdCBKZXJvbWUn
cyBzdWdnZXN0aW9uIGRpZCBub3Qgd29yaz8gQ2FuIHlvdSBwbGVhc2UKc2hhcmUgc29tZSBkZXRh
aWxzIGFzIHRvIHdoeSBpdCBkb2Vzbid0IHdvcmsuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpb
MF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8xajFwbnA1c2c3LmZzZkBz
dGFyYnVja2lzYWN5bG9uLmJheWxpYnJlLmNvbS8KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWFtbG9naWMvMTYzOWJiOWQtOWNiNy00MDlmLWJiZjgtYmZlNGE1ZDFiOGJjQGFtbG9n
aWMuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
