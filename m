Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD9C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9Dt4MZOgrv1WgZhhlqFinKPWuKgA7of5N7/OT6mZHk=; b=x+lOnOhVSPuoq7
	7/RoFhlLMy37Np9CbfV4Q65H/z+QLgS8S8W76kGFWiAh0yi6ZK93CdtWdXH90ZAMgmqst8cmP2yO8
	t1QTeA8AZKwjBhbSvb2YEhUgf+n+TteZyWFN4sI/bl2rrbz7I/O0cGWmOy3ZySEMYPgywFagUxT6d
	23QHbk+zb61ScmJqw807CMoRWg6I+bd2rHfUO0J+/zgvs4RDd4J5rYRojHRlaOjiJ8h3xLRjTDfgq
	DYJ+jL/Wf1vNEad6nsJm9ZQzopxrIed5sJLTGJZ4N6NTS241rTvkv3C27hRUpFHhr8WYvBpvVbz27
	eFt+gl4wjl80pfeakEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1s4-00Gm2F-29;
	Wed, 22 Mar 2023 17:03:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1rt-00Glp8-0j
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 17:03:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so11952085wmq.2
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679504595;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF0kXha0iC7DXFpAivYe8iA4rI1+YTj1bu366LSCxxk=;
        b=CODHf0ARi+ZAQwKJquFfTZVE8GcbNBB35tiLrdZgRYIyaxVhmUezxMFGMCvTfztcTb
         zBY391pL+wcccrmfHqacIkJ0YwfRwFpDfuCK+Q9mDDiiYUqxSVdqaFsm4UhJtdgAcOk/
         F6LAVGKFmL2U0VXmZXkuJANw/xDh74CEr1oqlpBHvEkF7uwCOz8mHJqBtcndkweTZu84
         EWxQDoQICuRUaPaLZel4wmpg8X6v3kZxBzpnge4qiQbhvPObr36dnM6Ec00/y5F17gEs
         WA6uVF72nkfgiZpQBflwbEFO/Re4i7Fk8rbofwYctPmB9ebZDYXgHUX0vTBFV7d3NVPO
         81zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679504595;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fF0kXha0iC7DXFpAivYe8iA4rI1+YTj1bu366LSCxxk=;
        b=1qNoxCN8XbeO4oXZ4+Il97xS2HBak8CdectAMRAT2jfWdS4IG3u2CqnCQH8O1Hc4i3
         Yf7iz9fzeFsPNGPxJ1mneMuXPJ72npKoiA9ysjO81z46+w3/IKD6EWz8Hg5obPowveWt
         8jkl9HpjR78iqMJOBC9V7MS9w4UCzrlo7wZQUFC9BCcI+LMTgZ07b7zmaVmJhFDTO2Mw
         Ifpq/vPuosq3JoGYQS/nyRllDA0u9RamrTK7uxgDOwYKFwZD4ot879+g08d0uQ++Fy5E
         nm2Kypvh4Cn1JjAyS8JL/Ps5MEEFwbRVqG3wRnneQ9OGseUo/xkznw4lRveWSTRdjZzI
         IF8Q==
X-Gm-Message-State: AO0yUKXST5exr7W1QbO9gK+9n8q69Mwak5UBvBb664LpvUKJ76fiEYW0
	IzYeaM9hSU8onAaXJ7I1snEUig==
X-Google-Smtp-Source: AK7set+XVsENvidhTYRl8NHap3p+RLXPJj7q9BKTdTDgxFMbLPVmRCtz/DO/KEbqCzBtozbr/f27Rw==
X-Received: by 2002:a05:600c:2c48:b0:3eb:39e0:3530 with SMTP id r8-20020a05600c2c4800b003eb39e03530mr125002wmg.41.1679504595001;
        Wed, 22 Mar 2023 10:03:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n1-20020a7bc5c1000000b003db03725e86sm17553580wmk.8.2023.03.22.10.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:03:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20230306103533.4915-1-johan+linaro@kernel.org>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Message-Id: <167950459423.530086.3154658002025345243.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 18:03:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_100321_288586_878D1F49 
X-CRM114-Status: UNSURE (   6.00  )
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

On Mon, 06 Mar 2023 11:35:33 +0100, Johan Hovold wrote:
> Make sure to unbind all subcomponents when binding the aggregate device
> fails.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: fix missing component unbind on bind errors
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ba98413bf45edbf33672e2539e321b851b2cfbd1

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
