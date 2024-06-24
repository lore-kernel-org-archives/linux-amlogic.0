Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7314C2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQojjpGxeUctn9mb2gmZBYSCESUIVJLpuO+v+90Zpdk=; b=uZP89vI3eABxf4
	puPnJ09qqkaGXx4blaqvTy6TtFf8IlwzkMY6hYcob1+XzqHBlHw6LwWcJ+ft+mq2pHa/fRw4rCZ+o
	Ju2wYu3IAdeoRno9JhSKd5O81d42JPvofcBZ3vtJYilb0B+G3v21hVza7lgRgEn5GeUTv8TL2vaN5
	eYTNYMdcjuNgG9wXPimnb+3OMFO6mu+hmuxr6S2w3koSazgob9F9eH2eoxzmcayrhboHL96FqmBkB
	5ZaOb9JBopLwUZFWdEW1vdFGOAdrZpO20zLL/A7GjRO7LoN3QrXaCsZ6GAo2Bw0DAZSTc9aefN6uU
	e0JFrZY1v8rfPKI7aUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLexP-0000000G0zr-05N9;
	Mon, 24 Jun 2024 08:21:47 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLex9-0000000G0qR-16X2
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 08:21:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so43994461fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217289; x=1719822089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7NcOeCTe6QbjgqW/a6BuGeeL6JmiMXVqSTnEvXy5Q0=;
        b=Mf6hd1YvmvV5/mje6ZarVQCRl7hDGRdMTNE51SXCUdlWEACAa6jhY/PDhwLmamqkst
         /T6ujbIRljoxDy1N5gAwuS8r1wbZCm8Nd5IRbIaJBuZCpced4nGPiz5LyTi5yCFmfdap
         TCb/1HB6fTSYIGVsnohQ+UvAM53eaMCL97DGBF4CYvgwt+RF9v2cV3w5fPAQTz+pLAuC
         +xR6gGd4QoKi/v8jYqkPy1LDUFg9hYEOC+vkqOgOSfXj7QBxgjbs1p/krZOcN7CV1lC4
         achAlJ/oea+KNIv3HBZqTnGa0xybea76D7ht8dTox4tc79/XryVgaCB2U4u0AeB1W2rs
         Y5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217289; x=1719822089;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7NcOeCTe6QbjgqW/a6BuGeeL6JmiMXVqSTnEvXy5Q0=;
        b=NPfIOyGJTQvXmC8yjriT/QlsKp0llMmOFj7/Ybz93lDbnyh84p9v+lxMketpSyyQk5
         RkuJ4psW1Xyy8+Y7NQvfevRPP7mL7Xaa5w8hVhqGwrNWe/3NyRylIIvVplEwSNeO9z4U
         jqNKbUpzU/71WlViiOUAyuPYsW2SQF9JgsLa8aFpSK6oWG3kVpcZJ3ql+NwP09hB0461
         6RQqUzBpnRvpBtaY39l4RaANVwR5PfcuwsQpMsWbygQWuFxdS8UthETIQQUt2HaQCrUI
         PGCXwgGSbzaYrI/ubzGq8zdwntAOY4DBidr3VEbWt6L3/SXGpsT5xBS1Msy2+SzpY8TW
         6gYw==
X-Forwarded-Encrypted: i=1; AJvYcCUNHAdO2KSBOHg891jwrXzD5FYv60jPeDBJBdqHAcSo7Ifmd1ecPg1m0zQv13cn0XkKkLNohEFsB8Bd+ELdwDtVCf/WtJ5jmN0QN+ifh9OVoLI=
X-Gm-Message-State: AOJu0YwGh/9dZn69KFjXpOBjC/qrXFfCID6Yo+kdlTzqAPkpJ5U6LYF9
	qtOP2rkuVziGGdXOlt581FZwXkZkvffHuZJCHQMAxq6zE5OiipAKWryAbKbgydM=
X-Google-Smtp-Source: AGHT+IGNlOezhcfigWHR887LWxcT/h/hglmHb1ED9g6uw0MBIQ2/Hju9mHH0wEbb+SX8JpBxqzajXg==
X-Received: by 2002:ac2:4838:0:b0:52b:79d6:5c28 with SMTP id 2adb3069b0e04-52ce185f6f8mr1966516e87.52.1719217288265;
        Mon, 24 Jun 2024 01:21:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910fd4sm124758095e9.30.2024.06.24.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:21:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
References: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
Subject: Re: [PATCH] firmware: meson_sm: add missing MODULE_DESCRIPTION()
 macro
Message-Id: <171921728754.3499470.13684580570905229720.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 10:21:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_012132_294111_C1A2DFAC 
X-CRM114-Status: UNSURE (   9.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 13 Jun 2024 14:18:48 -0700, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/meson/meson_sm.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/drivers)

[1/1] firmware: meson_sm: add missing MODULE_DESCRIPTION() macro
      https://git.kernel.org/amlogic/c/5375986e16207e573c0493009d25b0c01f44e01d

These changes has been applied on the intermediate git tree [1].

The v6.11/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
