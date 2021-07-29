Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40621C4320E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072F260ED4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 072F260ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MU8dR4ptasRHzLVUKdVCRVjdGsePvfm6+HufZrnE+As=; b=C9pgs77r5Pdyjq
	gnK1FV991WGcpwp2fdO6ap28V9pd9vZhx5+PgVobkVhHyxLa23FTuzpxmrCNIIYMtKpgP/x0UDXQo
	qTwShdsLhBLqdcS7auda2H9jtAi0GN3hCKGwVrjRD8nvfG09sEjTGZantxzco+Xhr+fg1dE6Q4ceH
	BeYNGhxd/XkV2YE7nhZdZSoO8XFjCcwtwz5/8I5K7DhqmcnAwYVCBv1kkGdoAxbMeyVFA3mer83v3
	7iiSix4QbrlcFgrm367duhggr26MRmF+Wusq+knpG9vmg+beRNLtUBrro0K+d2N0baIl9dk00AizQ
	mlPL6gZedPQzd+MGNHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m90OZ-003OVk-MX; Thu, 29 Jul 2021 07:23:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m90OL-003OTN-Gg; Thu, 29 Jul 2021 07:23:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so7926788pji.5; 
 Thu, 29 Jul 2021 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJuA/NpuWl+d3R+BteDi/e4fE2gH3i5TrGEWA+dEzWE=;
 b=TbyylpUJVjyWOLR1WnvG2NLgS6cJmLxM3guk5GI8rAG0O1KKtvLnt+nNEHy9HAEqPo
 PrqNReglKvjR1+2UmolhBCGb2ZQnG66R5czmCdj1RAicVu4Vi6k3VglbeIbqyJ/CChZB
 jtWou7jAfhCd4snItUg+UQ6Uisgr/0HZoWGgMyYCupQv1KbD0rAVFe42k2zqx63v7Gym
 XIiwbsRZ3vCa6QzNOSrZFCVqgHZBEy2Nc0vlgOPpdOdi6SJlrF0MJ2fopjsb/JW7rBCo
 zBqRu0MTBK1Nuc+VITGPesbn9E6HCkREK2u92SLqG4/ctgpgpZSe9TLUuap989LWhGrD
 9rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uJuA/NpuWl+d3R+BteDi/e4fE2gH3i5TrGEWA+dEzWE=;
 b=Vo6h2IVBwxXgtmPVCCEtCg357gx8QoLu80zfIu8ni9SaMM3caQchtzuSiky9Lsv/Sl
 Fi0vtUexW/YHOwER38AEqBugVlAncwar0rTbDBsAzmUUBNj9qQBRbilKv5Re2n8wUO9r
 R/r1w+8Nwps933JjwJBYmkWGKI0d5zRifqZ0zX7+omkyOVhf2FeCVNKV+SJ/O0JMT4YS
 0Ty+nknclEpsCRnwQGZz2UhKwfvfyVxEzr6Liwl6AisJKujwq4JshmAndYVJZQNbeRJ5
 aP/cbA7jIV0T1OAVGgs7Ap1u8ReihVSlsbrpRD94dIuQIobf4vnILyAU6vmMYgvPwDlQ
 CdUw==
X-Gm-Message-State: AOAM532inQ0cx8KfBAJ0Ox4Ygl4an/bwi7N1VUyXSZNkU9FJ4Z/NOImE
 qbIDCQBjXbsRLNi5liKKf0k=
X-Google-Smtp-Source: ABdhPJw/eDhUTGjmPXJR5uvWdI2MNStKLTc4GCI1hYZOqMt6pMKfvLXG+GxowZcOl5a0V78/iiGG6g==
X-Received: by 2002:a17:902:d897:b029:12b:2624:8aac with SMTP id
 b23-20020a170902d897b029012b26248aacmr3385012plz.58.1627543419064; 
 Thu, 29 Jul 2021 00:23:39 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:23:38 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 0/3 v3] watchdog: meson_gxbb_wdt: improve
Date: Thu, 29 Jul 2021 15:23:05 +0800
Message-Id: <20210729072308.1908904-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_002341_600184_8D1CFA38 
X-CRM114-Status: UNSURE (   6.80  )
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

Improve meson_gxbb_wdt driver

Source: https://lore.kernel.org/linux-watchdog/5229d62c-b327-254f-800f-1524f27491b3@roeck-us.net/T/
Remade using all suggestions from Guenter

* Added nowayout module parameter
* Added timeout module parameter
* Removed watchdog_stop_on_reboot (I feel that it is important to keep
the watchdog running during the reboot sequence, in the event that an
abnormal driver freezes the reboot process. This is my  personal opinion
and I hope the driver authors will agree with my proposal, if not just
ignore this last commit)

Artem Lapkin (3):
  watchdog: meson_gxbb_wdt: add nowayout parameter
  watchdog: meson_gxbb_wdt: add timeout parameter
  watchdog: meson_gxbb_wdt: remove stop_on_reboot

 drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
