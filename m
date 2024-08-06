Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636EDC52D6F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLCAjiVTkfBdVppEHLtQegiZK+n1fD6RS0vUUtDs3cM=; b=KRnjuNBobth+Ry
	XEiyqgVlyUjZ+OqgGbCgCSvvBj/tDVPimm0QG2gOgp7ZrxXXSkQHsUsRkAt2nVavGZ5GoHrtOrscS
	XG1MMAGYcTtACj/I1HlGtpjDu9grzVFWTe9xXZptsjN/CfXLjU+KL/0QdmVRMgXkIGhNFejk6l5zE
	Iz39pnTRTsPCA3M4W0uPg4unOPrdSmKca0ceJF25SVgUkVTTfK7ZchuAP17+Z7tYUJbdfhPRQzVV7
	z8LMy/5M4KG7Sah7P6WmHIKAeJo93H+tek7DojuWbOwVQ2jsTl84NETJqZIZTOPLthl+rbVBPyvLZ
	2cuoNBGwAZXZkG8rs1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGOi-000000015af-3tc6;
	Tue, 06 Aug 2024 09:22:28 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGOA-000000015Rr-1HIa
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 09:21:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so5065291fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722936112; x=1723540912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqkJhDv+6oUT4nQ2lKcK8oFvGgPM/oPyq4n6jeUGC6E=;
        b=UF3KwsqAZ5GAjPQ6B0GG3xvi6bcya9l1K+x8PlUz+gXnKx7nmjE0J1UQp9yWZt83Zy
         vKOyekCMs3ZX6E23ChoR4ctgFM3dUqFbVSpgadArnUqIEBlIqs9kxzJQ06l0hPBOLYOm
         svrEYWR2y47X+3M+UlPLlCtdRxabBtkPLNVD5dV02xryryiK9AlaJPadHwv4p1tgSxiC
         xO50u8W6JfFwv0YEf+QuXvjmb7e4qjiSTY1AHegVNq1L1mf1OPNWdT9buzu2q4cU83r5
         zpo/qjOMC9VJUamhW/9eqJmBRjBJBOwexV/XV1H2BA8RFogd2njGrw/e8oL+UgXwwrxo
         j4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722936112; x=1723540912;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqkJhDv+6oUT4nQ2lKcK8oFvGgPM/oPyq4n6jeUGC6E=;
        b=I0Sk/f2RfmPmmeCfqYbv4FA2j/awDDPGCTD3khCsIzzIKHCEhGIPlekOpkyTKv5r9o
         +V5nH7FTi/hI0+fuxjoLBTXr57AjVJCU+xAhvZ5CFIfhLXw/Yh8081HGwydwq4EJrOxl
         rZVySQ+sS/SXnY8k86gXHitF1oJw2GbF7DYzu5eN7h36bBLr3+119RzLXcD/xcdDbqYI
         yxfuC924jx4kv273KN/RIQyEZjguLYVKimXmqwqMkHhDzHpLakAXWodKicUyiMpf72Ef
         YsNpZRedhXue3KaTQK2RKw6l7MdcXg5opNdcMkehmK4NqB22GXJzMUGBGHdlwVNVd8Sj
         SuCA==
X-Forwarded-Encrypted: i=1; AJvYcCUwq6N1fdZzEnPZXQA5PWfDtwn8PLOS1VNGhrc2Ehm/BDobo+efgbwzQfAxSqJZix0mKpo3NjLYbhRZ7VYd9L21CdvCG2D7lj5O2UlwNnFb0+4=
X-Gm-Message-State: AOJu0YwIEtRNDacJvF/g+KAJcPInxcV5quh/WaUCy2zEja0+APwhOyRk
	Mua/ZC3xiF0mkGu90ESsq/H0lJYUMcXX+R1Z1GQ3+SsKzVx8u09nWQK3jyE377T5S76R+uITOTG
	h0fgYhg==
X-Google-Smtp-Source: AGHT+IFeTtsP8+6H91ULn+8s1Jzamf9Fh+dKBHWwa5CDk0Tz2O9PLeglp+ALCgLSDZU90YcDG0s7Ig==
X-Received: by 2002:a2e:9548:0:b0:2ef:265e:bb93 with SMTP id 38308e7fff4ca-2f15aa84e0cmr94527721fa.3.1722936111909;
        Tue, 06 Aug 2024 02:21:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c541:c0a5:2f43:ca78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb98109sm230716785e9.39.2024.08.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 02:21:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>,  linux-rt-users@vger.kernel.org,
  Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com,  Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240806065021.PINvpze_@linutronix.de> (Sebastian Andrzej
	Siewior's message of "Tue, 6 Aug 2024 08:50:21 +0200")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
	<1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
	<20240805153309.k_SfHw62@linutronix.de>
	<1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
	<20240806065021.PINvpze_@linutronix.de>
Date: Tue, 06 Aug 2024 11:21:50 +0200
Message-ID: <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_022154_458770_CAF795C5 
X-CRM114-Status: GOOD (  16.89  )
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

T24gVHVlIDA2IEF1ZyAyMDI0IGF0IDA4OjUwLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxi
aWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOgoKPiBPbiAyMDI0LTA4LTA1IDE4OjA3OjI4IFsr
MDIwMF0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+IEhpIFNlYmFzdGlhbiwKPiBIaSBKZXJvbWUs
Cj4KPj4gVGhhbmtzIGEgbG90IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gZGlnIGludG8gdGhlIGRy
aXZlciBzcGVjaWZpY3MuCj4+IFRoZSBJUlEgaGFuZGxlciBpcyBhY3R1YWxseSBub3QgYXdmdWxs
eSBjcml0aWNhbCBpbiB0aGlzIGNhc2UuIFRoZSBIVwo+PiB3aWxsIGNvbnRpbnVlIHRvIHJ1biBy
ZWdhcmRsZXNzIG9mIHRoZSBJUlEgYmVpbmcgYWNrZWQgb3Igbm90Cj4+IAo+PiBUaGUgcHVycG9z
ZSBvZiB0aGUgaGFuZGxlciBpcyBtYWlubHkgdG8gbGV0IEFsc2Ega25vdyB0aGF0IDEgKG9yIG1v
cmUpCj4+IHBlcmlvZCBpcyByZWFkeS4gSWYgYWxzYSBpcyB0b28gc2xvdyB0byByZWFjdCwgYW5k
IHRoZSBidWZmZXIgYWxsb3dzCj4+IGp1c3QgYSBmZXcgcGVyaW9kcywgdGhlIEhXIG1heSB1bmRl
ci9vdmVyZmxvdyB0aGUgYnVmZmVyLgo+PiAKPj4gSVJRRl9PTkVTSE9UIGlzIGZpbmUgYmVjYXVz
ZSBzbmRfcGNtX3BlcmlvZF9lbGFwc2VkKCkgJ25vdGlmaWVzJwo+PiBhbGwgcGFzdCBwZXJpb2Rz
LCBub3QganVzdCBvbmUuIFRoZSBpcnEgaGFuZGxlciBkb2VzIG5vdCBuZWVkIHRvCj4+IHJ1biBh
Z2FpbiB1bnRpbCB0aGlzIGZ1bmN0aW9uIGhhcyBiZWVuIGNhbGxlZC4gSXQgYWxzbyBoZWxwcyBp
ZiB0aGUKPj4gcGVyaW9kIGlzIHJpZGljdWxvdXNseSBzbWFsbCwgdG8gdHJ5IHRvIHJlZHVjZSB0
aGUgbnVtYmVyIG9mIElSUXMuCj4KPiBJUlFGX09ORVNIT1QgaXMgdXNlZCB0byBkaXNhYmxlIHRv
IGtlZXAgdGhlIElSUSBsaW5lIGRpc2FibGVkIChhZnRlciB0aGUKPiBwcmltYXJ5IGhhbmRsZXIp
IHdoaWxlIHRoZSB0aHJlYWRlZCBoYW5kbGVyIGlzIHJ1bm5pbmcuIFRoaXMgaW1wbGllcwo+IHRo
YXQgdGhlIHByaW1hcnkgaGFuZGxlciBtdXN0IG5vdCBiZSB0aHJlYWRlZCB1bmRlciBQUkVFTVBU
X1JULgo+IOKApgoKVGhpcyBpcyB0aGUgcG9pbnQgSSB3YXMgbWlzc2luZy4gSXQgaXMgY2xlYXIg
bm93LiBUaGFua3MgYSBsb3QuCgpJIGhhdmUgdHdlYWtlZCAjMSBhbmQgYWRkZWQgYSBmZXcgdGFn
cyBidXQgdGhlIGdpc3QgcmVtYWlucyB0aGUgc2FtZS4KSSB3YXMgZ29pbmcgdG8gYWRkIHlvdSB1
bmRlciAnU3VnZ2VzdGVkLWJ5JyBidXQgbWF5YmUgcHV0dGluZyB5b3UgYXMgdGhlCmFjdHVhbCBB
dXRob3Igd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZS4gCgpXaGF0IGRvIHlvdSBwcmVmZXIgPwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
