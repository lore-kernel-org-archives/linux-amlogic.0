Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49371C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07FBA207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07FBA207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULlgVN2sIW/ZOADE41dL9Uq/P6ocXBYpjx6EFfaJGoA=; b=eryOhqmnN/0njovUZSn7/HgCnH
	W5Ry5PcwqYbs1SwAaoAqGJZL+YK8wsu0QcabonoyV+mCvMkCJiD/4KWaMhDcx3kdVbncZVBvN9NYU
	SJDgK6qcfnfNZO6rfJnfmk/CaF6RrC4bLHiXTETA41uF8m63zjX0RKYZy4BtVb9vED7Lf+J7oKnrg
	8cyC6rOeorUpJ/Z/Uh2s4Ah/rsTxPj6zFTcwES/7ngkp1BI4JaIYv/kjAP5p+yli0aur8zCHxagPe
	4ZS9/iObTA3OpWb6AaF79VlAJ897/yKognCPzvSqsaqkzkz1MI3siifXBVrOpnRhY087CqrRR3756
	S4cGIUjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPv9-00073H-CT; Mon, 04 Jan 2021 13:29:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPv7-00071i-CO; Mon, 04 Jan 2021 13:29:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id d13so32136923wrc.13;
 Mon, 04 Jan 2021 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDDJAO12mWdz81SfN4SE3sY3sSE4phZfV6IOzBfLb7o=;
 b=AyaxGkK9oSW0SK9rGSfs/YkEz0nbaZL+5Dwqi481jU7zFdo7XjalMR6LACJzF0XoyX
 oo1MnoovVrTOpSQZ7R8ZKfGgMh4LuWrBMerzLzMMsueH8JzpoRl86ngySyP9L2KGFYXK
 ayOyuYQDqd5fik7dZ8rth5yW1Qxd4sU5utVUjK+5z5eJzI7zCFbHbUM+InVT6XAl/bvo
 RuAnvBo06ICfWVinxhaNREti7PGMLSBpstoEB5r/xxGNHuHScBHC7QJtROeQIuV9kB76
 2WbadKjxcRFYqadH7JHItdR77FJDpv8J+m70xc/1WfuyfvyZAMnhoRgTQtiLChJeZfs1
 oIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDDJAO12mWdz81SfN4SE3sY3sSE4phZfV6IOzBfLb7o=;
 b=pisox7eMSDtnbbZepeE46t1248rtz+2s3e/ku+ZOaDtDu540mqYGA1s6NWufKb+X3f
 eIXqWME3f5+Y4Fm4d+u3GrC4UNLQE92l553bzu7GFbzUxWOROSWLfsC23gaY6teGivio
 eT2CUBO8wc8BdrU416+InjcDFBdM1v6OzuI4kZ2SNGTuK4wAMiMJ3VOoaGQklQ5eFmjD
 kj2WsSLEGkO0AUn3YGIgWFEwNBKOnEZDlp8u/5Wp/oaYfliH+YS7qWFlaq9rOHQQW9qQ
 KRqWqiKhrlHwEi99Fu4A8SR5XDnKx8bCgo8XIOLuLuAaUFYT1ffa5VC0ypa8Ym98f8G3
 7h/w==
X-Gm-Message-State: AOAM532R0XuShaAmx07axvyWA7zKogA+zZYa3hqCeuV3Pqta5KzYOuoH
 Nyi2ECChYwkFpxOS+9MqIdM=
X-Google-Smtp-Source: ABdhPJz/siaI9EgHKtZAcRboER3/TG/xd8msE9THKkBWgr54MlNu7TX7+/jsGA0gUsDV15EpzqOcfA==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr83048697wrw.247.1609766951899; 
 Mon, 04 Jan 2021 05:29:11 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:11 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/5] clk: meson8b: video clock tree updates
Date: Mon,  4 Jan 2021 14:28:01 +0100
Message-Id: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082913_473337_839119D8 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

this is a small set of updates for the video clocks. I have verified
these patches to be able to generate the video clocks for 1080P, 720P
and a few other video modes.

The main "mystery" is still how the rate doubling happens. However,
that doesn't affect these patches as with this rate doubling the
"hdmi_pll_lvds_out" (which is a parent of this tree) is doubled as
well. That's why I am sending these patches because even with this
unknown part about rate doubling they will still be valid once that
unknown part has been figured out.



Martin Blumenstingl (5):
  clk: meson: meson8b: don't use MPLL1 as parent of vclk_in_sel
  clk: meson: meson8b: define the rate range for the hdmi_pll_dco clock
  clk: meson: meson8b: add the video clock divider tables
  clk: meson: meson8b: add the HDMI PLL M/N parameters
  clk: meson: meson8b: add the vid_pll_lvds_en gate clock

 drivers/clk/meson/meson8b.c | 79 ++++++++++++++++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h |  3 +-
 2 files changed, 79 insertions(+), 3 deletions(-)

-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
