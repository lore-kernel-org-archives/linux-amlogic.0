Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08A0C282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:58:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D7FE20811
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxVufiKM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CBqA5Wrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D7FE20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=347KmpLQQl4/trMLxQDpAeVR/LoCke8z7/kJjmrbUzc=; b=lxVufiKMYESERK
	R0OEnC132PUi5i8AaSZGpjeAi86bgy6Rsyg7eUBt4CwSPRuNAERUNeG05hslku0qflG3S97Gt/sUA
	F+FWRdiY1feMULrSrRdybwU6PgChP01NQisQKI6HE4Gt15UnEKkeVeo9sFAk41PGOD/vk3ewgmHZQ
	DdXBTgfRivx/o/OsIONhR5VPdTBoNTlYGASto+Q4WYo3fDWiM5TWm9HFgk9icV09AJDR/mW6UQMzG
	NkTm2nP921Z8cb+YCia+JfmyRFLJgifCKiRlXxjMjSZw10L8PnQh2x8v6InjBA5usc8EIBrFrDMXt
	254xpwqJRC1E5smz9X7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grapR-0005Ld-UX; Thu, 07 Feb 2019 03:58:22 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grapC-00058w-Sm
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:58:08 +0000
Received: by mail-pf1-x441.google.com with SMTP id f132so1885779pfa.6
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4vE9BU00uVWm07pHSl9XmaBqTKJTzMk4dRaKirmkAwg=;
 b=CBqA5Wrr5nQY0/io8LQVu2pwnh/AIGUtm3+pmy7XdGF2oStq4rizz1j9etGI1NO1Zn
 XURTlghKfEjPqbAnIqd0hKGTfRW+xUZkz8k7qrY4KtEDxMTb+Vr3LcTu4TESmgHD4WO7
 B8A5knEHG7wGmXGSBYchv80nJEPyX3aEen/9nb6AZRzBm0Ji3t42niAONu1H8MPo3BN5
 nDh4lD+hhOLwCwzBctqmNUOv2Dh8JtJQq2XlHKZsWOw96fIeHxlJ1BDSCcBN8YPigmAr
 BzpHDevJ1BPrAKUfbZjxz2j7n2AR8cBC2mbfKPXw4Yoei3/ahP60xJvYpJvwyiBtcgcC
 irlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=4vE9BU00uVWm07pHSl9XmaBqTKJTzMk4dRaKirmkAwg=;
 b=gGZTPJeGlR1129vye7z4lZmtNg36uc8B3S/kae6h6xj3hBAaxsABDHYF0voyr8Bg48
 tuPvKIddZxGud1DLsOaBOt31Ch0nureKN5wfleyiRx0OE7EqFwxVu/SxrMPFpik+7/Da
 iHgqYcuPFpp77TULsApdy5V8SSTycw2YPINZPI/FQG7+TK9jaudXSpb/bNDLv9uj+3Cj
 lbRa2dng/GxdEvb5IC2LV49ze1+i4pWLNctwqDnwmV9hwo+mkPi7G0Q4COCgwsOekQmb
 czTrT1tvl9U2YXP0hXIMYrgd97i+glSgoBfJ1PRUDRuQtStrtITkWgf/iTCZx69C8ASD
 iGjA==
X-Gm-Message-State: AHQUAuba7hoHAgyrVkIk/Tt9id/aBSWKkJ3XjUpPxKnZmv6FaM45p2iO
 DXyBWHf1Q/TmtAb5AhVfgoVmJg==
X-Google-Smtp-Source: AHgI3IaFp5sgEjJOCrn46BYjHmUjilzFj3AdOVe9WGP1fBe+lpzmN8tIosQ11mVSNyJcFcSb5SlsPQ==
X-Received: by 2002:a65:4784:: with SMTP id e4mr3129018pgs.12.1549511886237;
 Wed, 06 Feb 2019 19:58:06 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id d3sm9706256pgl.64.2019.02.06.19.58.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:58:05 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v6 0/4] clk: meson-g12a: Add EE clock controller driver
In-Reply-To: <5C55CDCE.9030502@baylibre.com>
References: <20190201145345.6795-1-jbrunet@baylibre.com>
 <5C55CDCE.9030502@baylibre.com>
Date: Wed, 06 Feb 2019 19:58:04 -0800
Message-ID: <7hbm3ogshf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_195806_929458_F2924B17 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IExlIDAx
LzAyLzIwMTkgMTU6NTMsIEplcm9tZSBCcnVuZXQgYSDDqWNyaXQgOgo+PiBUaGlzIHB1cnBvc2Ug
b2YgdGhpcyBwYXRjaHNldCBpcyB0byB0aGUgbWFpbiBjbG9jayBjb250cm9sbGVyIG9mIHRoZQo+
PiBnMTJhIFNvQyBmYW1pbHkKPj4gCj4+IFRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiB0aGUgcmVj
ZW50IHJld29yayB0aGUgbWVzb24gY2xvY2sgZGlyZWN0b3J5IFs3XS4KClsuLi5dCgo+IFJldmll
d2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4KPiBJJ20g
YXBwbHlpbmcgdGhlc2UgdG8gbmV4dC9kcml2ZXJzIGZvciBMaW51eCA1LjEtcmMxLCBpcyBpdCBu
ZWNlc3NhcnkgdG8KPiBoYXZlIGEgdGFnIGZvciB0aGUgaGVhZGVycyA/CgpPbmx5IGlmIHdlIGhh
dmUgc29tZSB1c2VycyB0aGF0IHdlIHdhbnQgdG8gbWVyZ2UgaW4gdGhlIHY1LjEgY3ljbGUKKHdo
aWNoIEkgaGF2ZW4ndCBzZWVuIHlldC4pCgpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
