Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C70C531F9
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Jul 2026 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk1+JoUt5Gj5o0MnxNFJ5vr2VBI/sA/8++VP46TcKbQ=; b=gStnbqDIRvqx6H
	hr4YOP+oU5uchstj5fPETWhSyN2xPdUW7+K/ag0Zn4xLQ1BEsEl+GA0EdHytHVjZH0f8O5Hm/8dNe
	6l9Nppd62Idm+ahYDsd/jgEyAePTbP1PwivEAgN7iLxzMfS8iL2CCdACFAkiRWi4FqklZFpa79njb
	WZoF2s9nV4ESV26RcPt+OWfKaHPpvRRQ36bwOW+6LGVbsK97z/xl5pMdukK0VZH+o+LBsN6K9jk2Q
	m8rCrhSEALhdeXg9zatzMax+qNGcSxqNT6qQzv+AoLfF2G8klryQSzq/rb32Cye5+tmrducsDKUjA
	xPvk4ea+OVjZyROnCukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWaJ-000000008yS-3al1;
	Sat, 25 Jul 2026 07:14:11 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnWaH-000000008xe-2xOa
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Jul 2026 07:14:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so1619166a12.3
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Jul 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784963647; x=1785568447; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=qNuY4WaF0LOaaCbvkp386R7N7FHlxLfqeteRr852i4Bc9vmSDdimAeirjfCtCR4i8j
         l5+oPfr8EzkxtgBUdzRP+aLszPw5ZjZ8MuTjxsmAnMXrESB54PvV0fad2JcCdcpPM2/5
         hOwzs0yttxQOTnNWTi8tjfFJqTgeK/N0RooGjA4B8g5VNH2MdaxJZ/57e9PiIrooZRwT
         ABtEDS47pdOhl5JBMeINJzda94Ji30iViRntu78AahXebqEHjizO0WkBtr3pFZbySssU
         uT6lKPcaXBMvMYWFFKgwqOPtY3Bt0zGAUAsT2aGTQWPVLejDlcK0rDofYd6s2E9g1o5K
         DXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784963647; x=1785568447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP/wbNLQSrW5qwWjE+qQUBSSCP+5d3b6gjSj9x/s0bc=;
        b=jiJOJpNtp8vNIMNrPpUX67Kl+XVgmyefLe5awqPDg8Vb4PupuPU823AwN+d977BjPD
         Rn0eHucD1lXwka3qZIr603SUNwYnGMtion+/nHAV1Un94IcokaEgFRx2cmRdq7BRlwvD
         BYmlD9q0/e4w3WOUbZf5llJ4T27417P/q5FCcjiT/34oqYyK+q/jweU1rwjaaDPgZjOA
         4QrpVnrKfQixYJyufbLNv97TSWcB35Kl/bsReT8xPv86URNsrFiAZe9GULCAw3ZiD7bY
         YVfQgrcVswi4ERguRBM8EYPo+6gQ717rKdCkGgoifZegKfBuGixCGEKBbUeHyGMWDNXb
         suVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzT6bg4MFn0H2KLbEAKGv8J2edtp4t2Z8W8cxOeHoFhA7RrladswrHbI6FIMrPUdXWdk88arF/vHF6t+zx@lists.infradead.org
X-Gm-Message-State: AOJu0Yza3/P327QbUjyqEIOAE9hORq1QpjFo28QV/idyji0aKR63p+e8
	6RSdeke0tmXmgv4yDfZuVmQf9fJusOV8u9Ps0hIhmBR5DIp+qXKWAklkci+UoiKH
X-Gm-Gg: AR+sD13KesCdC23adq8MRrmrhdAf9RuUiYKkKF8eW+04IJAPPKAd3chQl0O1nG5Ps5h
	qOX4oZG+trjXKmzMla3+6mySDqIb5zApNdFqeTD8WkoM3k2JNDBOV5ub464IW7ieLG4w33NvnTu
	2xiH9/yAZ9qumpRA2BxLjnBsExHuQyxD0tqIymZcetaXuYrxx1kItpghIO0qP60wHpbAf/lJqxn
	sBtkXIFMY55G5KquwTGX9Exvh1YG0INtfB5vA9MXytBF4iVyT2GzYCabqRzaUXC/c0YkGRbMOSM
	X2aJjlx5sYQCrMzsa3vqrRqNhEpCrV7ysIO6PaJJCDBiBm4Qy4r4FoyH1KIDNjsev4FqvvlAomH
	yXH1x9HLziNWtCLAHnkdYxwOHpCdTFUtM96CvC6pDN8p2bZ4QO2ha4GHG9rcZbODOIbWTMwYxgl
	hV+gNoiltVCsGQmr930H4KIp7v0zff8GKIgtRkfZdgbmPyA0Uxka1708KKNN5yiY+bA3EXBEA=
X-Received: by 2002:a05:6402:2692:b0:698:f7d:4e11 with SMTP id 4fb4d7f45d1cf-69fc0fed1bfmr434261a12.1.1784963647447;
        Sat, 25 Jul 2026 00:14:07 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb4e11519sm658390a12.0.2026.07.25.00.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2026 00:14:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
Date: Sat, 25 Jul 2026 09:13:53 +0200
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <49F34481-918C-42ED-92E9-DFC336526BAD@gmail.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
To: zhentao.guo@amlogic.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_001409_758539_A9F863BA 
X-CRM114-Status: GOOD (  14.21  )
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

Cgo+IFdpYWRvbW/Fm8SHIG5hcGlzYW5hIHByemV6IFpoZW50YW8gR3VvIHZpYSBCNCBSZWxheSA8
ZGV2bnVsbCt6aGVudGFvLmd1by5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3IGRuaXUgMjQgbGlw
IDIwMjYsIG8gZ29kei4gMDk6MDQ6Cj4gCj4gRnJvbTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3Vv
QGFtbG9naWMuY29tPgo+IAo+IEFkZCBTTV9MT0FEX1ZJREVPX0ZXIGF0IFNNQyBJRCAweGIyMDAw
MDBmIGluIHRoZSBjb21tYW5kCj4gdGFibGUgdG8gbG9hZCB2aWRlbyBmaXJtd2FyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5jb20+Cj4gLS0t
Cj4gZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jIHwgMSArCj4gMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvbWVz
b24vbWVzb25fc20uYyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+IGluZGV4
IGFiOTc1MWE1OWI1NS4uODg3Y2FhNWM2MjVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdh
cmUvbWVzb24vbWVzb25fc20uYwo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYwo+IEBAIC00OCw2ICs0OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fc21fY2hp
cCBneGJiX2NoaXAgPSB7Cj4gQ01EKFNNX1RIRVJNQUxfQ0FMSUJfUkVBRCwgMHg4MjAwMDA0Nyks
Cj4gQ01EKFNNX0ExX1BXUkNfU0VULCAweDgyMDAwMDkzKSwKPiBDTUQoU01fQTFfUFdSQ19HRVQs
IDB4ODIwMDAwOTUpLAo+ICsgQ01EKFNNX0xPQURfVklERU9fRlcsIDB4YjIwMDAwMGYpLAo+IHsg
Lyogc2VudGluZWwgKi8gfSwKPiB9LAo+IH07Cj4gCj4gLS0gCj4gMi40Mi4wCj4gCgpaaGVudGFv
LAoKV2hhdCBpcyByZXEuIGJhc2VsaW5lIGZvciB0aGlzIHBhdGNoPwoob3Igd2hhdCBleHRyYSBw
YXRjaGVzIGFyZSBuZWVkZWQgdG8gdGVzdCBpdCBvbiA3LjEgbWFpbmxpbmUpCgpBc2tpbmcgYXMg
YXBwbHlpbmcgb24gbWFpbmxpbmUgNy4xLjUgSeKAmW0gZ2V0dGluZzoKCnBhdGNoaW5nIGZpbGUg
ZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCkh1bmsgIzEgRkFJTEVEIGF0IDQ4Lgox
IG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNhdmluZyByZWplY3RzIHRvIGZpbGUgZHJpdmVycy9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jLnJlaiAgCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
