Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE1C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KArQNIHNLcnH4ax+/xQJVQ9uNzmlK8jIiMN4v1pKcGk=; b=w9q6u25CkrUuqw
	DTcoeP7kLX3vNfNoo0Jb+POfNrEpotEsABmSiCpMv4wKrLZOqkRwikyuE9Gb74+5qbBHQ8td6Uz/V
	LHi/Ss1k4FdW0vU+4sG7VF0MsSXs+orT/QqHQLWC+h2azL3JigxwHHtjJT4GwjBM/JnUr6vypHM6B
	VOgUb1KAAHaOAa1QyxYLRogvY0U6JwAoCc+9AvGnJyom2Cuy7C3x/ZHbG7fwckbDhzMmVEQyZQLfM
	lnTZsGxFv23aY0nYxXOI9g99MxPjM5uk6LldR0f2UWpMrAfquhSW4JqBcYIFn7fRt7bcQbrijygvp
	yBk7pE+5XlQ9X3eX4UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26nX-0068PH-AU; Fri, 17 Jun 2022 07:53:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26c7-0062i5-0R
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 07:41:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id fu3so7182273ejc.7
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jun 2022 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dc2j1luI+EEQwcvKzKkmXk1y8TKcznI85/RCQdiwek4=;
        b=AM/yF0SZhFhe55ijKRIPEIzK82JvEg4EsliZNev3dp4Y2MYPYIL8eHaPP9vX5+Kccy
         g3/22TU1s3pY1WvHbHMo1mKH7ST46k0DpinPx807RWI7hgHlcmXPh25xMP+bSOZn8xXv
         QTukUL31guc9BU/Br5f47zlC4aREXLm5Iv2ZV0Mxr9T2Tq3L19pR//nyU+BGZ8qDXrwB
         HnZz/hHd5hJsY3t07Jl4Bt7ASyVIHxkpnfODuYtp6DTRX/INpv82ADCrA3AD2yOA4p1A
         4xlS/xBL3Ekpo4TVaIoBz+7HtyvwXKHa9tBIxgiV6zLU6ki7GnK29EHh2LCEXFdcJeaZ
         uk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dc2j1luI+EEQwcvKzKkmXk1y8TKcznI85/RCQdiwek4=;
        b=n4OL0tr39Zey0yiMCxbueP9BhlWk36iApFD8e7OI7ZpvvKozZdDs2KvCPI/2AR4EiP
         Iat6CBPATODmzjye6/4GOgCS9kXnu48t8qIEAHfUNV/uadtLBY2m2WPL4ECwsF4ZPa78
         C4n6CLQ898SCnGzd3DNBDA1OhPSqqNtlXeXnag3okTahADaWeLZyzu1rn3yVJkReqDFH
         2vP00t0NN+hhiMD3T4MktOKbv2hpDmhLHGcXdUYg7V1Ojbyt17anHX/5yQQ8+83Ks/Zy
         mnbycoNucDyhD5F7l6cUz+t3WRwc6d6BWfj1h+sYTqRNbv6AnG3UQMrI1pBxfyoqvbIh
         vbxQ==
X-Gm-Message-State: AJIora8x+NoNzFFRv2dGaV9Evkufn+csCGil5H0y31etCfwDu3yb9tIc
	vQJzzJreF2WWLGDiEkkJwnqKqA==
X-Google-Smtp-Source: AGRyM1tZAZXo7GTDpqoNLhUn3VHg4tdTj8OCZfC2+XhmSuSswWoZNuRm1fWjwzAIofShk9gkbUtGNg==
X-Received: by 2002:a17:906:7a5c:b0:712:38a6:9ac0 with SMTP id i28-20020a1709067a5c00b0071238a69ac0mr8133174ejo.713.1655451713318;
        Fri, 17 Jun 2022 00:41:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7ca4c000000b0042e0385e724sm3212438edt.40.2022.06.17.00.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 00:41:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: martin.blumenstingl@googlemail.com,
	Liang He <windhl@126.com>,
	jbrunet@baylibre.com,
	khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
Date: Fri, 17 Jun 2022 09:41:50 +0200
Message-Id: <165545170511.1745152.4248111835075081590.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616144915.3988071-1-windhl@126.com>
References: <20220616144915.3988071-1-windhl@126.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_004155_106869_33451B8E 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, 16 Jun 2022 22:49:15 +0800, Liang He wrote:
> In meson_secure_pwrc_probe(), there is a refcount leak in one fail
> path.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/drivers)

[1/1] soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
      https://git.kernel.org/amlogic/c/d18529a4c12f66d83daac78045ea54063bd43257

These changes has been applied on the intermediate git tree [1].

The v5.20/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
