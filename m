Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EC3C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F0A217F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 20:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdEmSQfc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nGAz3/K7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F0A217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AplS/27swjn/KcGMldjlI6CWG3k3SpbCeFlmF7o9AJU=; b=jdEmSQfcJL8Su0
	wYDCGxUVu/+/WWvkfD3av5SSvBOccA0eL6I6n4V4Yhu+5BY+E2waDPDzOiCsv52g2Gcx34lNbEWeq
	FsduiZDN0VXnSPb5YbHnTkfqYm0NSMQ0e238eq2v0uaE19vfysdkG8tIdCmpE5D7idO7S4ksc0LFX
	3kZJIyCYgdZ/E1YEuOYGbOK/5+wUlPQ7y2ejzfrupsO7+Y5swTXRN5KFSHI47v3JZQXVeXZxMAq2j
	EzgPmqGyrUACW713a062CzgwCnqLXcg3mkW7KuRwHE0+iqfe/zxeMbcMgdhevFz+soW7WNDgyIJXw
	MPrLFgS//AjCgOGEvMpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTB8C-00045c-Nf; Tue, 21 May 2019 20:13:04 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTB7w-0003m9-Tx
 for linux-amlogic@lists.infradead.org; Tue, 21 May 2019 20:12:52 +0000
Received: by mail-pg1-x544.google.com with SMTP id n27so62102pgm.4
 for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2019 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=nGAz3/K7nDgzHUkL2D1i6CIQezGgnUsjYzvazG8X9DqvbZi0EVhUOGAifW2QuFKnvb
 LPbgTo9xZkZKG/71s03GLv/A/1Pg8SVuwZu0XzfrlwB5uV9srfccGrKOE0nkFASqsHkz
 FADTnbSOk/bhT92J9sej8s/kKgurOQRgWuvwOijz4gwS3WpI0tO32QLhXNzrJu/vl80J
 SImh5Q8d/8LpBUNpY8cPuudNDGJG+tpId07FLeBfDDRPbBWFCtta5M8dtAx9y3LdlFP4
 4SgyHSHbpnu+FW6O67mG4izAbM3V/24rAyt83xuCC7FYypjs6RJKO9g/vi0NkNEm2r9E
 gTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=nSMrBlQQCNOdHw6ym1MsOYq9Zt6fXAndfJkhXIkeTfY=;
 b=RX8sj1n+jHE9Mzt5Io8JSBiAr26NLa1LXlWAeV+EJzzOkd6/k7XkcKAJx8HBQVHV/8
 0xQH07aoOx35FODW5Ro9cSP+A5OOYXC2DDNSOtYj6t56vr9ODfnMvtlkS3SPKiluzymC
 r8Tm6CMeJpTdwf8rRGwPH0b4oOv58M0GElVmnH5cDggEQRmBy7h0E+sHv5HbIKw35BFk
 OQjAwwpjcgqpkvT/+TF1KPGkESTKuhNuHYKS7fgfDktU2xJ0YEc4vqq1y64v6xn51V4g
 /9WR1fR8+PqXDtcfjNGogcd0aCspmDe+xwIANMlsxjJs2SKT9jjjMiK4zIlfP6NKnaL7
 k6JA==
X-Gm-Message-State: APjAAAW1mm+xac1vgRWdREx8HEq48qZLKMOyxNUdhQ27IYI/pAXyvPiM
 rZNuZbJryOc3mQkQMNz2Ok+A8A==
X-Google-Smtp-Source: APXvYqz7BB/aqbr8wvZrYS3zm53Qa+Pz6ZrLainUe1XyeFYrKx0BPyui0jV7qdhS8urpyEaQbyptOQ==
X-Received: by 2002:aa7:9f01:: with SMTP id g1mr77010922pfr.259.1558469567850; 
 Tue, 21 May 2019 13:12:47 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b1ca:3800:3284:d770])
 by smtp.googlemail.com with ESMTPSA id
 n27sm48379192pfb.129.2019.05.21.13.12.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 13:12:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH 2/2] mmc: meson-mx-sdio: update with SPDX Licence
 identifier
In-Reply-To: <20190520143647.2503-3-narmstrong@baylibre.com>
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <20190520143647.2503-3-narmstrong@baylibre.com>
Date: Tue, 21 May 2019 13:12:46 -0700
Message-ID: <7h36l77eip.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_131249_362227_38FA6B41 
X-CRM114-Status: UNSURE (   4.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
