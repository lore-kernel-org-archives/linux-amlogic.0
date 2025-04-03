Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C0C3600C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Apr 2025 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQok7Hx3U42JI6Ll+vUOybReiw1qrOtcHSnxtoYdwms=; b=RKzKKfnroLiH3u
	plNLMNbrbvA2yGVY8W1Es03uzJ4tcyRLjvjBQdy/appVomdQzINm6i/i+2OmuRNsyvqC3MFpxC24A
	Ywu97vhmYcjbF47OFxUhXdUQGUftU9cyPUDk64tZmVrZcR4VORIlwZB5ytnU3ceWUxPoNBUdibA2C
	xYUQRMT8bvTBzgflFMvymM4sGd9ymql70BY78clloNFF4wOkugpBPtwfG/AiqMdGN9s1eMHc8AXjo
	GZL6l6nSj+M0BQUMrjhvVqsREgF3psuUTIU4w8v5/WRQ6VklYXFrWn9x6ksQ0zFR2/k5f5OWZDprK
	TS735ilx7OTeEJKqlnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GGj-00000008Irl-3rcw;
	Thu, 03 Apr 2025 08:49:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GGh-00000008Ipv-2ohW
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Apr 2025 08:49:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so3154575e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Apr 2025 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670186; x=1744274986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=KemPZFLJgaNO/hWGdv2nvSq0Ygc0gZKjETB0Be+3OjUiyHw0DBEWjMWa2o5k+CvkjB
         581WyzC59ovGbxYu3GIMnHGRrtZf9RBv4KUbmraPprJs2xQwPfla/P/Wahtd7JneHKje
         m7ZNiPXK2vsJfNx/mycQdk/dYpDtfsueEbxTxIxxKAVsTNUqyv1pHQDNP7VN6gTlXcQn
         yij2I5uhPP+5NOYU4F9/X7+nQlg3btSWrREMUeqKy1qZhY61HnRYtg4sbCIer2bzVFfC
         SGBazFrKDDGhxzKOZsoh9EDxZSivmReoQ27Lrzg/41fci71BWKBer51c23+NiuYYnkAX
         M0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670186; x=1744274986;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=A9bQBjVyY92l/WAmo40NT6f6nDNIbtRb69zA31lclAvNOknIs2CRr0Iwv+A8cu6IuV
         CmVePfbw7w8TUkZuT5Dgyk7MkbRA5jmqkwnawknpbwd93rXGZ5LvHNiJ4kAS5sMEcPst
         T7nmuRCb3ti+DjNfxk01/vxH4ljre/MEaU47TJl5EDGTmZ3K1oYSw8ZXyzRCVzVYJzVy
         XrAk3en+tTI9ytc/pxWkeuk8fBbK8dCxJgUv9ibFjNWP7VyWbgAkXj7P6vPgUQws7/wF
         RxuDqsXBUtrPT9u8fDd5QSiBKIsWeD+QWqado+3HVkiiTehrCR7vheVJ+XnP+5SUhSci
         Ew3A==
X-Forwarded-Encrypted: i=1; AJvYcCX4RskK1sav98Q4YN3KmYvoJpGRwPFytwS+1HAkGyySLZGEA78C2+rBBMRVq0bkLjmcY00HLaL6UeFE5qpA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4u3V/wiHql2MmPDTL7L3beofUS9DKHmrh6f6QJm7/wQ1BLdGF
	IcpcSzXdTehrE/Eyu7rwnGAq+KXQID0l2ZwwRsfjN1mA0ck3FsBpq8rLpiEP/Jw=
X-Gm-Gg: ASbGnct9m6KBevR4vbTqcC5Gg/FqR9x7H/Jvn5CDfg5dYe6TfYOFGFR6MApoLepHXS/
	nKCGW1Ni2MmMXK++aSGXCz8e0A1sVlH7T4AB9hY5CrofcIZIPRF4HC+Uh2mtLrxMOHVqmFpJkH2
	8yHqzDH3RLsY9THvoo8V8Z1x2QoP6qndPt/ZwoD3Ux/KAbZST8vYYpw6jshGwyCjUDqotESRaVY
	/E5yEGgTKnyD/CyYHwLG4GZFQqXJb1ojPlXJMYGavFVPsGkcGc+/7E8I3AbrE1Izm6CKFPNlltu
	uRWVuQZHcRdr1NNboxONTrz721sKz4BQDpQ4T8xyWi8laWycM53I8H+dB0MOr/xQ8g==
X-Google-Smtp-Source: AGHT+IHXc5iNcd+rK/nAzT2TA4Y/VmWE4yJGK6u8qDCUGXOzUoFZeO8r9utVgQgnH5ORrul8GFjY2w==
X-Received: by 2002:a05:600c:1c22:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43eb5bfc50cmr55015725e9.2.1743670185785;
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d07csm11578105e9.28.2025.04.03.01.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size
 of clk-measure
Message-Id: <174367018513.531300.4479678290582017713.b4-ty@linaro.org>
Date: Thu, 03 Apr 2025 10:49:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_014947_742545_3F69A956 
X-CRM114-Status: GOOD (  10.39  )
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

On Wed, 05 Feb 2025 15:58:43 +0800, Chuan Liu wrote:
> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
> the structure to specify the count of msr_id.
> 
> Mark the table of msr_id as const.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/1] soc: amlogic: clk-measure: Optimize the memory size of clk-measure
      https://git.kernel.org/amlogic/c/37021be47d02d2913d6767795a6f4c72b4e63a4f

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
