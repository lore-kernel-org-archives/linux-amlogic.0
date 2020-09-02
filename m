Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C478C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:57:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A11820767
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0uEm4vh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oryep4f/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A11820767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J1fbyTNHO07DOguvIguie2LSTvQBHM9aYYrzi5zHKTw=; b=h0uEm4vh2GM0fdTkHvcyPOeQK
	CggzXbKBMEw7dgJUaXQwKBS1e4Z5NQOMfdQBP/IhYoZSFFmX6M2jUmYbGE/a/TH0IYL9lWeuq+jMu
	CoYvzjY5sjY7R6RJI6v/xKQ7lNTvjfRxWt8JFsKFOzMdQaO+NZ71E2g8TMM3cEwQTUG0Q9XIdEQbk
	SJv/i3ZP1TXYq8KGZ5dTk/E/ga3+qS5VwDjH2qYdxTrx4+2AyDo0JO8AH9qTxcHJN1i1KTJnkBpWJ
	Ij+UBYHQcvw/W7iQ/9fJzy4+969Zdo+MuFKZLbBnbQM5LI2OYIgaVVlrKvuv9eS+LZosbyR203cKY
	BQaSeqyDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYsH-0004Cf-3G; Wed, 02 Sep 2020 19:56:53 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYsE-0004CA-ML; Wed, 02 Sep 2020 19:56:51 +0000
Received: by mail-pj1-x1041.google.com with SMTP id np15so2608217pjb.0;
 Wed, 02 Sep 2020 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kuKGy0nMzCedIxYfbaeRSNCf0OjAifTH7DorC8oMLIc=;
 b=Oryep4f/il09PEeRvkAzCa5yEamHX3IfI4haHnZFqft2sDVyMzWOa2oW6q5r7iV5cP
 4WT9+KMNL0+EhJccY9W2L8b8ZRNf5/yo2w1W4WhJ8XUROyxfdUB59D07znI18+pINr/N
 BcNZBzI0Gy8lVLdV6hEaC0yuvFtHvvTjC55K9Sa9xT2q7JBJXf2m3p90Sa3cB7/q91y0
 ceFFSnakSGrgS6Uk+aqsVKfyHoIJd+8xJXzN2S5xseiX/Z3zDW4R94HHyVGEN+V6jqOz
 ByLYj8x/gERQejNbUXCouYpjDKb2Tvtc67e8dxDbrAFFi+bTIhE6bVbxm/6YTah8KX7G
 xOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuKGy0nMzCedIxYfbaeRSNCf0OjAifTH7DorC8oMLIc=;
 b=rI0bu58BhJUAbw/1IjGO4VEzpwbz/HIBS9kGaVyOey5mv9cV3P1HwgO90o4XTbZtbC
 EVy+W9oARDlKo7d1FYuvkXhbkztmyKf5WQdsDlu5MS0sQf0fKfKwksAjr1UsoPU/Fwcl
 Y2nWnb4A17KRFSOUeiS77NQoC2u4akGqCooL5CnqTp1VVjh4C9RfPoYNrSip1bCvkwI9
 nGqh7QwAvbbxFKxl/IKOaKfJejXSCQDhrsrwn6xoReBRRa0jUMzg71WS89v4mZv/I5f9
 /+XG3+SDyc6RtbguCDep9HyfaZYPW4Mkml0/CUhVAYzqIojPuXv+MIK4S/V88ZcRsfB/
 D1xQ==
X-Gm-Message-State: AOAM5333agnkSFZ7WgzfqOKGEV6rf4+lwndYsUqsks/ZwpT96bVHV1Jh
 sa4TUWyc/JL2lrFL0t/cnDE=
X-Google-Smtp-Source: ABdhPJyEGSaG8BPaN9z2skZyEo+FUnajjLrY5nUupDll1Zmgpd/sTj0J5IIHRSDG1t8oto5PtF2n8Q==
X-Received: by 2002:a17:902:d213:: with SMTP id
 t19mr111855ply.46.1599076606592; 
 Wed, 02 Sep 2020 12:56:46 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id t20sm225492pjg.21.2020.09.02.12.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 12:56:45 -0700 (PDT)
Subject: Re: [PATCH 01/11] mmc: bcm2835: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-2-krzk@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <03ecf673-908c-823e-484b-7c442ad16621@gmail.com>
Date: Wed, 2 Sep 2020 12:56:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902193658.20539-2-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_155650_755158_6D7D460F 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 9/2/2020 12:36 PM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
