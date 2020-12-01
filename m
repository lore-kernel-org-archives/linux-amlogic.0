Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE191C63777
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9159F206ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5D/Zfer";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MqW7DpSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9159F206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8k/RFZHnFds/0D6GEIKs0e68XLJrT6Bos7HNXMGRIf0=; b=O5D/ZferafkuBV8wQH7ajaVHw
	OapGeApwKeqcde94f1gyI46DusLS3iPnQs+IcYWPmeBpouu7E2c7YVqTQx1GuLNBp7Kd1l+/VeskP
	SlpeN1hKVPauSPVpkubqQ3IEeBMtgretc+ydMisod3hUFz4BH9czS5TWJNjBT9FTnR31NAeuot2xu
	XLP+FGbUBrSY8Gx6fyYFg6YzVsJnMdtmeRWL6uVRl7Hh7OIvg2eSNyMKvvr4aPVI7r303oJ8twX+v
	dWwNCO223n8qS7+xRJlfi648m0ZAzL976wPmDys+eQL8I8z5lzXqwLf+2gEfqLFxfO70S37P+ttls
	0r86a88iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjt9A-0004tz-PR; Tue, 01 Dec 2020 00:03:56 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjt97-0004tC-DF
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 00:03:54 +0000
Received: by mail-pl1-x642.google.com with SMTP id v21so46082plo.12
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Nov 2020 16:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNlEFUw3WIu5X/RkuCRlgAtwXJZvDq05hfWplllmYns=;
 b=MqW7DpSBs3wPvTtDCSmbu7MBS8C9KIXpa3Uv7uXkdsMxQRs2zx9NCmd5z9XcYAY85+
 QdHYaegfiMjhCDQrZk70++0SmfawfyXT2A4rSZ8WfYwg+nLE47ossll3HWZ6/+zXUoqb
 EL1zXa6JnOfmS15SOBLHaf6nxKYhMc0Th/CLTzEy0rXlROnwrSU/ddP7Ua2RATlQsUVi
 0z4GxdYxZCfap2+KjaygLvnIY6cXhdoKzOmjdpTRTLEO30IEiFPjwj7MY1dgwHebOdhy
 bKCmty6lwdT8mW6WSfsbNBdeJOTpHEqihmp6bi1H3OdsAzjHJVkE0oIFwhB5PWfNs1Xn
 t4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNlEFUw3WIu5X/RkuCRlgAtwXJZvDq05hfWplllmYns=;
 b=klrCgkU5CwYnZNlCC9fpXutmrSy+1PgLGvyEjK2Z2bZ0ahkWVeJ3YbIMVki5rCjY54
 vVTqe+2PL51jmPTfeM6JDn89NiRadavg1KTfUgvbJXFMIYjpH27K/oclI7URMfVEgQ9x
 3AQLext68R9TLyl5vu4jcvgSD/aLvcgYFNcdz+YKKl86PsaomDzXOyCQ82B4OHQ2niRe
 Pj77i6nnh/R8rC8Tvc2nnXy+xHpv3xwgJS8aCSjlqRJ9FsrBfdJhVpS8NAVLKGnBANY/
 33DYK6tHNmTv8UrjpcsAMeSn5ZBXQnUp40d6Y31maMuHhqin2ZYTuIgKTt1kW8UbzzfW
 5bvQ==
X-Gm-Message-State: AOAM530b/BhKetbWwQNBj1Cdpbw2DfwmLXM9/S3ODwxrHsp0RROd3Slc
 kpsqkXBc2MpTxTxO7fCh+Wf5wg==
X-Google-Smtp-Source: ABdhPJxmZcP3uPA+KwWVlhYo+Ncc9k7aW3qiUqAaCVhFkVMH8Pg7XH8O3bU3BLt3FvogcLp6EMFGEQ==
X-Received: by 2002:a17:90a:3d48:: with SMTP id
 o8mr308131pjf.103.1606781027822; 
 Mon, 30 Nov 2020 16:03:47 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m73sm96645pfd.106.2020.11.30.16.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 16:03:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yejune Deng <yejune.deng@gmail.com>, jbrunet@baylibre.com,
 p.zabel@pengutronix.de, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH] soc: amlogic: replace devm_reset_control_array_get()
Date: Mon, 30 Nov 2020 16:03:46 -0800
Message-Id: <160678102118.27831.17587037083495740823.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
References: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_190353_576176_11B62B55 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 10:48:20 +0800, Yejune Deng wrote:
> devm_reset_control_array_get_exclusive() looks more readable

Applied, thanks!

[1/1] soc: amlogic: replace devm_reset_control_array_get()
      commit: 978d0dbb98c7ce9a5d6897744ac49ac5ff85831e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
