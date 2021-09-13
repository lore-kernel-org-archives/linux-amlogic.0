Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1648C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:40:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6649E60F6D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6649E60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR49uc+8CTi/8t0FmQWNIrqcLyWiFUt3FxBScyxf0WA=; b=h7yVlV54PD8qDF
	pKVKOISv2dkbkqK4KtFlYUqgjM+gcaax4vFwxg/zKBXJvJgf+bOT5XNIdpQnbiUoxIlC/qS80FcV+
	1oB9Fb0OJHLbF2Kck4EMdV5x3TFAoWeZzPgSxqFQ+NCkQ+YPI6yQIiKD9Ttykc9Et+MBbJppI1zzR
	zJSsgg/74t5HojyQ/sf+JrayB99AACSXBgWksUgqqs5SXjFK8d/22Nqu78fqnN+9Idg1aZ+mly0h3
	guOcX7Qx8aa9F1h8ubw7YtsW6lyuW41nQu0X9fsyfHU41nSN5AuGawj66M9pH7OtcUuzpPD+JTq2o
	8QIVrtoSAU/uot9XFnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPga6-000XU3-O2; Mon, 13 Sep 2021 07:40:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgZs-000XSz-Sx
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 07:40:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id s24so5886780wmh.4
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n04uv+5XZibLMvnKtKrfRDH3+weTdkw09nbWu1hNmlc=;
 b=wsgAb4G/K5UxMew/W56NQo+1LNvjCkVxwU1V0ZhcSZ+rvNxwJSWx4m1pz6x4hGrQxK
 Gyj7rBJSe28d6HN8IxzDHci3Xyl9W9zQg6izgeR41kn42D7y+3iloWNqLIft86cNRauT
 wIVfLtr3XhvdN7VOnIxFzDg07AqfI4lUq8oGoZfuKlzYAeN7WzP3mlu32SPLAGcza3oN
 ogKOXBq2JI4PBXgIexfUrNK8nxaDjAZTXbB1CDT6hE6z70klluLir6OH/m9OlcCmpq5+
 8jgudv8U8/6DUmNfh17UpEFfsa0Bb5YXRe9Wxqy8I41Xyw4e69vMDF0Y7numKAg7Bp6k
 ycUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n04uv+5XZibLMvnKtKrfRDH3+weTdkw09nbWu1hNmlc=;
 b=vmk26oX5WO15koMUcZMlYRLSxDA/d/PXwck6nANfz3Fa7TJpSS/NhrqRAPLRwxT1MP
 TVnfbTijr7qjbxuirrF5Xmn2fR4J6ngAHWbJ8oXM/VN74bJ2MXsRJs1wj0ekswdO7yAQ
 Bw3mx+jbIrpCfiST0JA/OOKNU3u69+kcDhB1k4ZI+F4DQAZ83m20tM446NxtDwlyN2Po
 X6lHK+DoRoWZFpMkn0WIXqUy7uiVqTyBk+AZd21cl3svIdNLBywkWAYk/HERSPvTBYJ5
 u0g9l602YWU5R+2fimFP8V9ODo1RNHCjV9Pf/wBGNyjCKK9c40DvhvT7JjWUzs69X7a/
 5cKQ==
X-Gm-Message-State: AOAM531oRK6NDvjeGCBzp8O8/Q6XVE/b18xtg4rt787qPQYbiPrqN+eO
 w1OtDofbIaXEiq3DBAHDjhmyuj5egM/cV2hV
X-Google-Smtp-Source: ABdhPJzouOaDRn0i2zebwvu9kOCOJAUKxzokE2T0UQsD8Z69uqJJWRN+U39Khmzjr07F+SzXqNlopg==
X-Received: by 2002:a05:600c:1550:: with SMTP id
 f16mr9970372wmg.111.1631518829984; 
 Mon, 13 Sep 2021 00:40:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id y1sm6315828wmq.43.2021.09.13.00.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:40:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa
 Zero
Date: Mon, 13 Sep 2021 09:40:30 +0200
Message-Id: <163151878415.815936.12618295918725996638.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820012718.10761-1-christianshewitt@gmail.com>
References: <20210820012718.10761-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_004033_008154_E4D4BBF6 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri, 20 Aug 2021 01:27:18 +0000, Christian Hewitt wrote:
> Add the SOC ID for the S905Y2 used in the Radxa Zero. Before/After:
> 
> [    0.321650] soc soc0: Amlogic Meson G12A (Unknown) Revision 28:b (30:2) Detected
> [    0.318533] soc soc0: Amlogic Meson G12A (S905Y2) Revision 28:b (30:2) Detected

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/1] soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa Zero
      https://git.kernel.org/amlogic/c/ca8d1fda5b7d2f81ba9c5649462a7c0b64ae9dcd

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
