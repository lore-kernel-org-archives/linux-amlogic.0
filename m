Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36647C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0902B20854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="APeRxFse";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nRJZhfnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0902B20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5psHPTnZTOGrjh3UIGgimf4WJKtkFrp1c88UYNOcTc=; b=APeRxFse/iPBqr
	tEv5sCqQNMhAImDs7uWR+TZsl3HcuVkvRZhNmlcPi1zRD/dtXZFvDeshQkWTP2m4hZt+FmSmQpD03
	tPGHjDDBecipDKHRkj0GRkkCRf2P3z9lLcKCkzo5OnKIZdCyIFHtavgAFvUogYcX4BIRvpFpxmFbf
	7Hsl2JBnmKH3ir1B0oryubFMqHy2uW1btq2GxpwtvVo8y5Yq8c1ZR+An/GHM4QLn/Y1PRS4noAvFc
	U7Ed509S9ha9BeH0RSece7/KL8t8/XKaXmz7rX0XpOn1vRNG/e86o6zbTWv6ryHOQhua595ZwtbnN
	y0nJfR49AhcLN7Jj6A2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6HQX-0002LM-MA; Tue, 19 Mar 2019 16:17:21 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6HQJ-00025H-L0
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 16:17:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id y3so4961013pgk.12
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=r6fCR0Ba++QOuxz6R+4A4oS+Zt54avu6KSLhTyIAJSc=;
 b=nRJZhfnmhnyP7yqNTqtX3dofQ4Nk5Qo+78ekVgNnrD9jiAwtEz7IMyldhperXeOLpz
 4undoaMb7UkqX6bIns/qvuN+JwTIB5ez0XYuOFXInz1an8AaZtdztOsaMqJeuD9aGCE1
 NVFN89pcvnjGLDhHNWsgVIOr1h6X30Hs0l0Sn1Qsg1oFmgX4R+/RR1q2dGJezoJOn79j
 ekxaNlly32/WoWzq5hoykBT9l9IAKOMzUCmEcL6+LyBhc10yRgEwqxlTVrArQZiAjXjt
 KeGsASAEgoXp0a1cfeNnMLCmzjd/jq2IcqfuvWObJZAplvoBmK9KZzG87kghFNXJmLo/
 Ovyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=r6fCR0Ba++QOuxz6R+4A4oS+Zt54avu6KSLhTyIAJSc=;
 b=hhlOQS50vAGE1kLaWO8zzAMVsnaneXfw8tNMam9YDvTGMoNv89zeqFerZ8bMJDIaql
 vhLZ8ccp+DsrvBJu69npHZ5isWpmpR7r+Nz31nKNbvrC2FzQewrzfWLk/kqLlqNK5k8l
 +TS9odMZlKS+bYRT1qYl/78DgirVYx+YWoBOik/o0q8eqqPAWj30D8hY+Wi7XTFS4M7N
 awZR4L4wBxeFQAclECY1pEMf5apD4PF57W9AZDwuc1lhOsreQRXVPT3Dl7mKGUvTMUM2
 RgkrFU7st74qZHlBGYEyDpGSxPwUIgdX3qB3SE9loyPbvT8O+I9nny6lh/VDT4NOkCAn
 OrHQ==
X-Gm-Message-State: APjAAAWZeitPmgHjYnXGmxUMFHQKqNnZUZPJ6bnsslJQ1h//DPR++ZaG
 yXxaXU/iaIR7c/LXvBG2Sb5yWw==
X-Google-Smtp-Source: APXvYqyTh4Rz3ZIjKty65iBaLCRjboFLLl+hqSEPoWui2KPGhH4GS2c3aIqkV3tGPbTvLDzMR2P+wQ==
X-Received: by 2002:a65:6154:: with SMTP id o20mr2557086pgv.205.1553012227183; 
 Tue, 19 Mar 2019 09:17:07 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 i72sm29114760pfj.147.2019.03.19.09.17.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Mar 2019 09:17:06 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: meson: fix a potential memory leak
 in meson_nfc_read_buf
In-Reply-To: <20190318204722.9901-3-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
 <20190318204722.9901-3-martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 09:17:05 -0700
Message-ID: <7hva0eg7pa.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_091707_692630_FA9080D5 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 liang.yang@amlogic.com, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> meson_nfc_dma_buffer_setup() is called with the "info" buffer which is
> allocated a few lines before using kzalloc(). If
> meson_nfc_dma_buffer_setup() fails we need to free the allocated "info"
> buffer instead of only freeing it upon success.
>
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
