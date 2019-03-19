Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41DDC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9531120854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ii1wu1RS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S2IlJaR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9531120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEy4HV8qrm3l3kuR30JVwUtUuXFgwm/7tgsc3fwjm/4=; b=ii1wu1RSb6ciTF
	fl3C8yXsxVgIcaUsw0KCGxU5wrK939bZxJ0pfmuowYNsORaolIE7u1qPjUS4xV6EdnI0mN4OX1GfX
	x21XZ5NCgAPNYjZdvSo0O7i0R64DJwsyNllBoyJzyLHmwiixICG/qrQwPMKj+SrRzCRpbfyTCQRVG
	fiZUXPt2BDlvfd282hmCK6oF+UUSFg8rR1ReoVLBsa5CQBCUGJuke3Jf8DimxE/+dQwpvvyDgdxKa
	9nSpDI7vwjPuy4N+k0ZEGjROZuXOvFl7REA3J3XN05zbS7ip1QVesXXZWX3Iro/YvQPmorz5z3n8G
	z9NvzioYEdhAOonR09xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6HQ6-0001qU-CX; Tue, 19 Mar 2019 16:16:54 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6HQ4-0001pv-IQ
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 16:16:53 +0000
Received: by mail-pg1-x542.google.com with SMTP id g8so3531139pgf.2
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AVUDGAKMXL02had+OfqDpgrMI7oxWdy7jajLhNkrmyE=;
 b=S2IlJaR1xm8sukVefIyGyCJ1F5AE9+cotz3qtiXFXWrsLH+KitmIjXSdkZoh5Rdhzq
 Ckog4x47NulvYgX7aCLITngufAINlgwtcHFdkg3brS+iEuwYCU9Fh09+N0iZ6hrzEata
 QsrtXvd9BQJmVq7TTrYluKxCFWQ/MtO9yq+PBBRitBlOVIl2MT/XOXW4JWm088KsPc0d
 e3KiWhmxt0AYeiSngftqkFvzpPqud5k2lx/dJeZN6jXEqbLMaYEGacDpKGTbHpBeL4PQ
 4pWKRZuiOrjAtlqYggy8gn34ePLQIXv3Bx3fRih/t/nQcUn3cCK10b34OxdI8+1dbFj3
 Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AVUDGAKMXL02had+OfqDpgrMI7oxWdy7jajLhNkrmyE=;
 b=mVq6EEwsmbjD34FqaT3jzfsTDrdkPtdVw8dHqw6N5CvlPo1I5McPVy024nlZuP4T/x
 r/8gSXmkpiBIz8AfrV8AMuQGwIt9mmhKWx/WJvnsNm4iJ2O1IWerDZRpOHsnXcSQgwAI
 IUm3He4D03EtJCefsiPe8Cqywyy+CfZvQcVrDor7mbUD1sMLTdVWfedlpeQfF9ERkDGX
 oQq/fEThs12Un5+DWzorS8QMkbfpvhYoUWO2qZswkKrpgxLzYYrdB2Wh+JCHkMDE/XaW
 5xqJlwd4DsIT3VuNkmDuBY8u1KfDBdj1mzh77As32uvNk4wweizhfrpiw4jb7CPzER36
 diyg==
X-Gm-Message-State: APjAAAX4QEhDifKjEWEEa9e0MBbQFpKNlOkBr5OxV1ZSHIt0YenOQmjp
 a5w/FoRCrPJamQMaCw2NS9Ac7g==
X-Google-Smtp-Source: APXvYqwj6y8yzmHlW8DfzTGUVXLjBxzZQpe+ovEtdOmKaOCF/pwWJ4ULKIWhqbt0hTzt/Eotj3fscw==
X-Received: by 2002:a63:ed0a:: with SMTP id d10mr2580885pgi.452.1553012211556; 
 Tue, 19 Mar 2019 09:16:51 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id x5sm16510833pgp.68.2019.03.19.09.16.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Mar 2019 09:16:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/2] mtd: rawnand: meson: add missing ENOMEM check in
 meson_nfc_read_buf()
In-Reply-To: <20190318204722.9901-2-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
 <20190318204722.9901-2-martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 09:16:50 -0700
Message-ID: <7hy35ag7pp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_091652_645689_EC19CBC9 
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

> kzalloc() can return NULL if memory could not be allocated. Check the
> return value of the kzalloc() call in meson_nfc_read_buf() to make it
> consistent with other memory allocations within the meson_nand driver.
>
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
