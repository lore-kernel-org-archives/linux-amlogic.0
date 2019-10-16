Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AEAFA372A
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:43:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56FD12168B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 16:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3bB+ECG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rUVvtmAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56FD12168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5be95U+qHujhlXQFJmxnpwZvRksD6dtjeng52RoVAes=; b=X3bB+ECGpsOFyY
	nancARxCu4oTsjSC0OubkBumVXTZuArbWwJVyf7Zak/3FHTLGQvL2CKrleMicAGSmANkIp0VzxBCf
	e16QqmHuauV1BKG39KBvOC5d0/wZS5AJ+4Y8IkGmfvYfNJTW9bBBAX36wiLdDukDgNQYBL45m64Cc
	x4nfk4TIBGkIVRL9at3R9SBDpXU0Ub5ye8W6gTbItntzgeNFzhcdAt9U0eJV0rfDIFpytlEDNrHxi
	bKtLC1ekkfl9L490R2+xP3ky+WTs1iBU/ICtnIf2Yp1482WvaXMCn0zx6ohoU3rAs2gLM8wb/gdb3
	b76S03k9+BUHpusoOSQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKmOI-0008Bn-J5; Wed, 16 Oct 2019 16:43:14 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKmNw-0007td-Oj
 for linux-amlogic@lists.infradead.org; Wed, 16 Oct 2019 16:42:54 +0000
Received: by mail-pl1-x641.google.com with SMTP id s17so11527407plp.6
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Oct 2019 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=57uyxmoXhyIZG8+XPLz4fjpdkC+Q+fEOX17k+/hG6tY=;
 b=rUVvtmAdciiJfC7zc4iHMpw0uFh5wPbykASFgtkhhw4m6QvnfcyqH34IwbX3rt2paY
 S5eDisYcUokzkMN0ZlmKCeGbkDuF9ZpAO+PqcB9/zZacqIJvpbgiEQZKMVUEVyA5zNlz
 dkXXvQ867OpBmcb0Txd1GiCGy3r8/dK57xR4mNDDpRLHNaO0SM81tF4UH5eF5Kx8uQUY
 5E9cNIQMD0zJdPtVFt7+OEY2+ZJCDurQ07h3cRCzwpA59yudNtwCCW7htiobEkO5+sKy
 BY5woMUym4gpM5RN5h0C6g9T/oPCjR13uI5ktka4HojeQajPoJZHgLzDzzCLXmqZOtw9
 12jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=57uyxmoXhyIZG8+XPLz4fjpdkC+Q+fEOX17k+/hG6tY=;
 b=AAbjOz6XH6632vo45FHbdQJ8lYHBrYt8nUoiIWVuqYHV+juyDCm4Q6iXMarDSy9TTz
 00IgBkYw7Cr7+0xr0QTr9vVPlELlledwJ8Xd66aQwdXOx2/ub+8aK3eQ2QeGKlA2h1P0
 iyhSLsQ54RhMMGvLn0C3QWHJ+j/ezpKm6vy7BW6Ud7EwcNWQCa2zPB3IuAeMpPZX/2nd
 GTb9VOw4N+em1JjDSyDWuL+LSHWllFdM/2OXlYCIiOEV7xAnzBeN+7z2JkL/2LjtAPc2
 b7r/vAUmBUnX75gZNW0iG0vonUADgz/eXXXe2HXijpJWETQGTkShzI/9rrjtCKcWWH7a
 Go9A==
X-Gm-Message-State: APjAAAUXoTR5AAPyJlUdYf4hMfudXgTzvGIArOu/2NPdr+uA2FtFXzvv
 vty0mh2/9EFJffxGOmbYj/97sw==
X-Google-Smtp-Source: APXvYqzYGefqM+N97RnNolUGlVbbJgqvYENkUacnJagIFtdqHenQ0FP2dvlvfgAmmN8wCkoVChDPiQ==
X-Received: by 2002:a17:902:8505:: with SMTP id
 bj5mr6102750plb.31.1571244171732; 
 Wed, 16 Oct 2019 09:42:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n23sm23363431pff.137.2019.10.16.09.42.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Oct 2019 09:42:51 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org,
 rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v7 4/7] arm64: dts: meson: g12: Add minimal thermal zone
In-Reply-To: <20191004090114.30694-5-glaroque@baylibre.com>
References: <20191004090114.30694-1-glaroque@baylibre.com>
 <20191004090114.30694-5-glaroque@baylibre.com>
Date: Wed, 16 Oct 2019 09:42:50 -0700
Message-ID: <7hsgnsfxpx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_094252_846916_DF0FDED1 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)

nit: subject should be "arm64: dts: amlogic" (not meson).

I fixed it up when applying,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
