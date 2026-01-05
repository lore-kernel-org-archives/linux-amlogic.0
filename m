Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3337AC2A07A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vy7yRtHhhYxR7riK6TsOC8l4/qzmYcQXXP4dfoKjzYw=; b=I4viAJP1Qs/NuA
	zSkSuTUhO/+XeDtBvqwITpMLD+Onvnh4Vxtbleaf3UDuADgk3XxAOQEFKqEN06/X2sgP4O626j9aH
	2S6AtNnTAh6ME7bHTYsI0PKKnskyjvkQ24A1+3wHPIM3Mj452ozC+qEYcHNa42HsZ4g3dClkqaFK1
	BOCuTl0IpagXPfthAAjpr2FI7cl6ZllM92mlyun5oBaIDFvgR/1lMOMFT7GH3//ZHvfK9QgfsX8oE
	nBq8fUbB0gKulmTdW3nK+kF3jX75Lqd5hKfXpw70uIrm9IcOocKHDfj6Bq/rTnAa8H7RZSrvjwoj9
	QcVFnAVh/DLRNQ3+IxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgfg-0000000B3Cx-1DrE;
	Mon, 05 Jan 2026 09:14:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgfc-0000000B3C8-1opU
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 09:14:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6934635e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 01:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767604474; x=1768209274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=2bZHY2chWHb9R7o8s8kb3GAgXI8p/4L1Hin9f++ybe1DZptJJun0VsX5K+u75XzDaX
         XEgxg8IWtqN+YYkdtjw8PtgLccdQKoYBTM/fJDbcxrxe0VAGzjDdGVV2OJHoW60lz3UC
         Xl13sbSj8kv1//gGzw+hw8/0acBPE7A/fcbAJrZeunfJAXom9XLwZyKMk6c2RbviRPCF
         wL86RlPVOtzOczapbhUwGG+g6izWMl6EFqeVJYn5zIzvtkgoquHktKyadA1PgnzXdsdh
         EWpq2D8MZ7H9grb6PKSnlGEMbWRQcKiBhxF99accwGIYdZqTnic09N9sZStznSo2wffr
         fZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604474; x=1768209274;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miCvpSGVqVVCNMF4tIx1RWrVqnyi6qhzDTvcjYnjzjQ=;
        b=aLjP2Epc4NGbhDDPCrrXOgz+fIKGxPY32G0kF8F9i1NgLhT5o5nsXTN5Eai4sAQzvk
         kUGcQX9TzwYmvyspcZSMt0qDvkm18y5aoz4+M2xU05QuMnKyMWuDiwi+3u9A1PPNdQsK
         MipG6F+53lV52MYWJ8RooMRHlXyQEps53VGEffl8NliNRyQsWtgv+fEsZkdu4OeYyEh4
         WDrP8eR52cfHiUSJ83ODR432Tn6pubdDj+dwKZjZ5OQlX/jB8nD480IYcBlPCnvK/pXE
         rXcAl7VZQIQWV8eYx2eXdl18pVI56rAQ1SSDr+vWkKgRI/TjwtnLwT6VfNihGDbhj0SR
         8zwg==
X-Forwarded-Encrypted: i=1; AJvYcCVQSFtgioltDER2O7w1nVvXd5Sf/XR2wsX84+SVuv3UAhQTLam5O5s2fy0BLVrOEOzsd/mKt2t414rlLmkj@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3PL0qlysZ8WTBujvlRIKIDr2g7SJBPEjfz01/ypsYuoBQ7L0
	kIklS79ZMVbVhKfwvzm9JELUWcLFHuB+QFf+zW1aJ0/rGH2pOmSf6mljIgK/4MJC+KY=
X-Gm-Gg: AY/fxX72BB9B8A/bcAdJ00nQMBMqPgDzuyLRaZkduWg6shV9L4Pt1lu72Ry0pCmmYpd
	gsfqNaBrFojA45AYwJ1fxTacsGShO2fIDWFEyyyOl2mbBHRUqV+jQ0qs2xE5QqQeAxyovX33dxe
	krQ3RCsq1YrIRGdFS24Sm4k+eAttMxfsa/LR6UixKtIy5P5f3XbyCPi5xR7B7r+L9bArZulpZ34
	IufLtstP8A6LBUbxz0Bx0ATvOsWCYgkFKbqJYHDKncZs6rGtS/OE/hz4sM+gaFN4EPejw9tZNFp
	OWVU8Sz9UUUSyYQ8ShKhlPHRSal2yCLuzIwtcC3a6SbvIK/HmylE/Tn+slLaLrQbPqXjUvpxW6O
	YI2hKMjzDTfwDwYRlhEeZkAsk8XVB9IbUWZBgsmmCyCT70PCHbjPSaHl/bcySkZyjDnQyXASK7I
	UKf+foNxvq
X-Google-Smtp-Source: AGHT+IHg/Mv8ok8g3lfkv+f6Gs1iCHZthZ9+dvCaKIuCn41ycCh3KmnkNqkRkT2jAbCijygn0KRwvA==
X-Received: by 2002:a05:600c:4704:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d6ba8900dmr100501615e9.16.1767604474097;
        Mon, 05 Jan 2026 01:14:34 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b336:bcf:8603:f6e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d6d143f6asm147207955e9.6.2026.01.05.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:14:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com> (Chuan Liu's
	message of "Tue, 23 Dec 2025 20:27:39 +0800")
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
	<20251028-a5-clk-v4-5-e62ca0aae243@amlogic.com>
	<1jpl857e2w.fsf@starbuckisacylon.baylibre.com>
	<425ebeb4-8001-4493-882b-dfee87ed82c8@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 Jan 2026 10:14:31 +0100
Message-ID: <1jldice808.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_011436_495783_B6183D8E 
X-CRM114-Status: UNSURE (   5.57  )
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

T24gbWFyLiAyMyBkw6ljLiAyMDI1IGF0IDIwOjI3LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxv
Z2ljLmNvbT4gd3JvdGU6Cgo+Pj4gKwo+Pj4gKyNkZWZpbmUgQTVfQ09NUF9TRUxfV0lUSF9UQUIo
X25hbWUsIF9yZWcsIF9zaGlmdCwgX21hc2ssIF9wZGF0YSwgX3RhYmxlKSBcCj4+IE5vLCBhZGp1
c3QgeW91ciBtYWluIG1hY3JvLgo+PiAKPgo+IERvIHlvdSBtZWFuIHRvIHVuaWZ5IHRoaXMgaW50
byBhIHNpbmdsZSBtYWNybyBoZXJlPyBMaWtlIHRoaXM6Cj4KPiAjZGVmaW5lIEE1X0NPTVBfU0VM
KF9uYW1lLCBfcmVnLCBfc2hpZnQsIF9tYXNrLCBfcGRhdGEsIF90YWJsZSkgXAo+ICAgIE1FU09O
X0NPTVBfU0VMKGE1XywgX25hbWUsIF9yZWcsIF9zaGlmdCwgX21hc2ssIF9wZGF0YSwgX3RhYmxl
LCAwLCAwKQo+CgpZZXMsIHBvc3NpYmx5CgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
