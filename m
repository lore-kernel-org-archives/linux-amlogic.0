Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB81C282DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E4A120715
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QWu/pPWY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dENCSx36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E4A120715
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ajsk4CFwe+qKnZUDNQN9kRORW1anLue4qRWrS3nJxTg=; b=QWu/pPWYTdUWKH
	oLRXDLpIqP/TT7sOgT0SAnLaiY1mrCAc2FBQ2Zn2eu1QUBNquXILuQ0om3KRVZTdW7CPBjLvAnyI6
	diZYYrq+F10Zk46ae9WvBuekWwFsxaW8qYBvrnEA5is1QiMKqE5dmVOyWD0DevY1rnwnSvOwQwQYI
	vQ4pDbj3m+RqOsnUlz4SjAqCwNHwbSy8KnP6c0ZebnWjbyMKjALUcYBzA+Xu/Q3b/PpS4Fxn8tmw/
	MElVxIQVDWMiZjlylFxJP+QCjAWHvePETfxfAIANt2IERhneTSyu0TJ+nh+FmGX9bPdkZAPaFIgyi
	uernLDlnMz3+inzDmWgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioxw5-0003y9-2r; Tue, 07 Jan 2020 23:06:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioxw1-0003wj-Mn; Tue, 07 Jan 2020 23:06:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id g17so1435148wro.2;
 Tue, 07 Jan 2020 15:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k53sXXKoetFWE8GEEtNytoJYTuHWX23InQV8Qtu4GW8=;
 b=dENCSx36Ej5yYSporQHM0EZQIerJ0te/h42mTZ93EZeOg3JsA0ESBCTSif6qckRHaK
 rxYMyDM0wGr41OJ2wQeUr7uJj/nCJ8ALhT6f97PH0oGrtASQk3eYzqvQOtRH3qQWWWwx
 Ho396dQoJvVeasv15P595WzKK8uGDMOS1Gb7xy1PCzg5rStuXm783K0aXg8PvyEsqwcc
 0Kv2PcFCaSI0VcA/G9ZJ0gRUOB1v2TJnFP2eDUKvRyDpbozAEjmrT1BmVFLBNrGXTkxO
 khCbSxJQEspIlT9GtOklM+pRR9sEXoxc6beW7uWvF23m/lxNCBKzBu4R931JQ2k4H5DN
 O2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k53sXXKoetFWE8GEEtNytoJYTuHWX23InQV8Qtu4GW8=;
 b=FNPvPFv8i8krC6Ct1rrcwnTL3HQ/7ySTlKJKZI4UPDA1UVwPiIO86qtT8z3PNnSkQw
 G0nJDT4z9lemu2hTbNjdXaCLhDKsoRlCatWXzG5AK9RXkHpbkkeA3iQQKwbtmVaLgphH
 Td3N2em7jjp8In9cLalihB9V7A2W5lvTD8JO9nZKpPUUM0yV7nG9pT89Qp+NLkpAXKpP
 H6GD8Aj7AZMxR0oQiaCK9l+YpHpiBy3edB9waU5bHKyk9nvi388QWBuKF+wHbQM0zln0
 j/kdDn9I2yw/1Pb6VIyOxGhkbXVNd8V7Ov/eGXPpayeT+JBS1iJitdvppREcLuv5Jn0i
 ftng==
X-Gm-Message-State: APjAAAXuxupaaqmR0WhudusUEN21g2QueQgbc+5d3YnBC+LfXhITWjWe
 J2Im8rIyVh6b+zorvx6XKzg=
X-Google-Smtp-Source: APXvYqyl3Me0mVoi+rzI0uDTtUjURQ5KbxgWv7vhF2OviRpzvAMJ9EZQEFf+m7UCcWGXNpC/5ZwHsw==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr1270198wru.173.1578438408111; 
 Tue, 07 Jan 2020 15:06:48 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 0/3] devfreq fixes for panfrost
Date: Wed,  8 Jan 2020 00:06:23 +0100
Message-Id: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_150649_768900_EAB8F093 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These are a bunch of devfreq fixes for panfrost that came up in a
discussion with Robin Murphy during the code-review of the lima
devfreq patches: [0]

I am only able to test patch #1 properly because the only boards with
panfrost GPU that I have are using an Amlogic SoC. We don't have
support for the OPP tables or dynamic clock changes there yet.
So patches #2 and #3 are compile-tested only.


[0] https://patchwork.freedesktop.org/patch/346898/

Martin Blumenstingl (3):
  drm/panfrost: enable devfreq based the "operating-points-v2" property
  drm/panfrost: call dev_pm_opp_of_remove_table() in all error-paths
  drm/panfrost: Use the mali-supply regulator for control again

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 33 ++++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
