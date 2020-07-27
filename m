Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BACC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CA72073E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p35IpluH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R2jjdbqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CA72073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiNi2RPvkDWLsyWVbNLrKAKb5HZMMDVebA5bs5LUGAI=; b=p35IpluH/2RRhhhuCPiftgY1Xl
	mnU4zEtMxuo03y2zSjyiJ8dbn/tRnE4AAD9aK94Cd0ysb+O+RQQsQp3mrUP1t4jKqFjOBLECLhEk5
	fCNMAjsgRAQdyebF9147Dzu2A7N2uwbvUYZ6DT2zgaYn+jCvSQV7ZFYfFMCPumR4hiMZEm6i2FwjZ
	9BnrPD0DYggA1utnan+ShIaUpxVUMDZ5QW9Zw2tIDtDXxsZryR/OpBSqiYaKQk4dt/9Twb40F+t4a
	rsTfZu2Dvuo7Rpm+AsWNFbvmBbe324l5KmmcnQNHOj0cOcnvJpQJdNeRR+HulAnF72myqebrq7I8C
	hBUKgqhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k08eO-0004VT-G0; Mon, 27 Jul 2020 19:19:04 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08eL-0004TT-5k
 for linux-amlogic@lists.infradead.org; Mon, 27 Jul 2020 19:19:02 +0000
Received: by mail-pj1-x1042.google.com with SMTP id c6so3587586pje.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2020 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KYcxnJiJj69tRTiEAadwyrdtR22boWUN2z9HB/fXNUA=;
 b=R2jjdbqKOeMyZXLB5gCmo1dIyD9OXYKPAw+app2x6HmA8T10ZwHHuGiPJj3zRmg6O7
 1Kh9JSmdZ1lQWiFdA9qmTn0+xQjjDc5+40Vwtt44N8cymoskiaKIubLi364r/FxULAYZ
 d0cyj50JO7V7RoocGGEctm4t/IqWYi/7QEc647x1JKyp99qd9q5Vdzz9vaS0ICmd3Gni
 TVW7BrlR7HduEobquyFjGm0jjX1nZdfZUuKAeZ/OLCrRhocMGZMdopallxdVUWyPa4L3
 XrMnPwSV2+3bsPyAPrhLet0db6mtxzHtCuvWmHQa8tlfiQUBdGFh/CpHQGL7MYakiAy5
 Qopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KYcxnJiJj69tRTiEAadwyrdtR22boWUN2z9HB/fXNUA=;
 b=YMLZMNxzyMfI6tuUtCO9DjwT7zopRrO32SpcHFLa0DP+BL76fSWU0GusXJeyRzEDlt
 RP8FOUjBjIhRTdiDBiSQiFzNGGLXhGeQSfkIL+8GxCV/dgRk7Ao1L0jVlxp9bEd61/aD
 KY9GOLqjLXfZzx8vALXAH48TKchN9MLOJifovGBh3GwcmjkSQ/J6x5b6DIB1Ut5XPc38
 6ns7daNftigkXQVjeQvljljmliH4JnsrlKwKxe7z3u9IPTERxOr19yz/m3ZdHKzIPJjW
 ZKnH3zpRJM3ERtfBW7rJx9WBYCdDMZQ0MFzhuNVlK+no/HdBvC0UL23KZ0+peo2anKiJ
 oDkA==
X-Gm-Message-State: AOAM531V5SD/hPdv9rdKwY4EjDVwaxZ1VkWMB4Lx5z8n36FuiRvm+QdI
 xxnr2eE0F55X3KN15d5PBolMHRNli5cd+g==
X-Google-Smtp-Source: ABdhPJz2jqCiQQNL40op8DOdoDG7P0HFj98+NtEUkvD4/UOy/rpmH+LlNHdciSjH2PKrVot5+x/gRg==
X-Received: by 2002:a17:902:6bc2:: with SMTP id
 m2mr19056144plt.119.1595877536516; 
 Mon, 27 Jul 2020 12:18:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o10sm345581pjo.55.2020.07.27.12.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:18:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
Date: Mon, 27 Jul 2020 12:18:53 -0700
Message-Id: <159587752409.20735.8859718228289623070.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721015950.11816-1-christianshewitt@gmail.com>
References: <20200721015950.11816-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_151901_288706_D214A9F0 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 01:59:50 +0000, Christian Hewitt wrote:
> Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
> tuning errors on VIM3 after a few hours uptime:
> 
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
      commit: f1bb924e8f5b50752a80fa5b48c43003680a7b64

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
