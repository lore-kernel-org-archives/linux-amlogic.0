Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5DAC5CFDB
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpV9zLvbjw5x6fXGLMvGxatATd6gBtQVCUoT+UvqnfE=; b=D0wEkHwDxs3T+d
	j2JaaNzZca3ZABMaxrGlCgjkAG96NL64bDDpjpk56LTlddgcety3MVUaO0wSDZWbmxb2Bxgn1lYrK
	+rdcodAeazR8KCUvWUnriit9oBoj75/MAQHPjPwuE50WU89Ii2WDjyc2/VHKJsLnif4c2aOCbmicn
	3TAktM4Z9/3DIqkiPhlnCa6vs+TU+VH1LesO0z24t3/VEYsyew7ztjl7nZIR4XITGeOy/ChBFHsBp
	Y4DaL1u0Jd4XW5KDhIWOWSJOMk5uLkwqdLbyArgbkNMX6DsANRicFcYlnc8W1fugL5Re3gdceOlAV
	3YwvSD0gxwJNKdVw7OEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq6w-00000002av3-0RpE;
	Fri, 14 Aug 2026 11:30:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq6t-00000002auj-1Qsg
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 11:30:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fde295992so667024f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786707001; x=1787311801; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qSRVi6rE8VMPSSkScWq+jHFmOMJRNe08YnZV6a0P7BI=;
        b=dUBUgeS1ZopHxha8z+VoGFJ+h/03pgEl5Eg8PsyZWUIErUvkDlvGq3hnfcBtrB/py5
         1ulsmWwhVDse7UxP854bZkr8c/dAyT1KXzOa0VNB2W+gNQc4apRVUwGn8WRfA9r0qFWy
         u7kAljF9vMYyey0Wh5XvH7iamSRHwVSCI7uZGlc9UfPWlSSiXczfUZ32ADCuIkNpWjeU
         zCtUC3wGoshxb/Q+0mBLq57cSm39NNITjIrpPm7eP1E9VBb0JrP89RnIXoQDLaFZHCuQ
         kNFYtQZNR4AGgj/HIJyZV4rb6xqD0pbu+GlxqzqcqVYCqSqgjIuyZsQPpP92PfjgEkrF
         8mKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786707001; x=1787311801;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qSRVi6rE8VMPSSkScWq+jHFmOMJRNe08YnZV6a0P7BI=;
        b=FFivn2ha+7YB0K0+K+GGZmUL12iZoZH/ocbkaaqPVKq382NdWKPBSw7wwyBsaJ2voO
         IT5ngHBTyPP1EFB3BA36zDaCtxoOyFyvAWilAZDt0PT7KBrdfmwgVI+/trkBIPRbIRpa
         3l8Tg/jA2UlcEN2IMKmPD/6WbvPx8Qz26CB8L9RC6Qa1ukvJ8/nxVCIxaLcGUGx6Q0TY
         176zH2veF7X/NnNfQgxqk/E93Z15dQN6yiTDZPUzgIvsukijIuN4SW3D9rO4f3Jt0mo3
         B9Gi7UA2xKXsKlXKIsTdxRv6WdTh6Bqae+i0gcEjNI9n8hgp/tLdmthvj1HUNaAbprdy
         Rn9g==
X-Forwarded-Encrypted: i=1; AHgh+RrMfrG4lyDpofaUJGGTnvvZpSizDNJ7BBtM3TStZJtUTduQWHQUtmKCjPtS3A93xM7NAckY6jcGvVnLhpug@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cXGs/we6LhZQLQPQX6JDsb5jcKIy6Re2STJOLn29AeoJezbG
	ucVw3Gklmc2q1sxMdzSxaRe872GOqRMJEFaHdR6tKSaiw3WCqAq9nnWMhm127p34KRXcBAKELCa
	Vt+smfWDjzTWL
X-Gm-Gg: AR+sD135YCO2HF9rggsb5ttP1IsKaE6IyUERC4/mAsrI9xhQkIXtVSQ+aw34fS3ZpQX
	V37jmuwKE2cjgzQ1AJY8pJN7hNEu3r5jKJ5rBWU0v1AJydC+OybwuZ09srBO5nmnicDtUid+XkW
	cdw9oBRotYOJFtFJv9C0L09eqe+xRR9M4/YlrJMlJHaHBIPw4rtCEwy0bOL5ackVePQgMoy4jyd
	gBpDrTa57mWFh0e9JVIShDzAFlZ23GbOCYSfYUubY8LBE1YHpuRlZo6NdNrPxuA6aqFjEqERCMX
	2jsb8H3ZIdj+8sN1f22SvZEqST8nBkMgxnA2y01GSbPudzowACR/gkSWc/F1d3ZLThd3ZK6F8BA
	1ye0EEcsZ82f0BSY1VHpbTt0UkaQvXoxprf28SUvVB4uVrwbIx9ePvFH6iLvSI08+0kyteKx/ah
	eKXjY+NCkoh4m0R6ZBkcMW1NoSLJ7jUfWKTFqj/D6apamzpVCMHqxarQuBAg0V0ESdH0/aahc=
X-Received: by 2002:a05:6000:4022:b0:47f:7ea0:6c20 with SMTP id ffacd0b85a97d-481607a6158mr7464630f8f.15.1786707001164;
        Fri, 14 Aug 2026 04:30:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815f2cc811sm7217490f8f.33.2026.08.14.04.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:30:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org, phucduc.bui@gmail.com
Cc: sashiko-reviews@lists.linux.dev, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
In-Reply-To: <20260814095120.235F21F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 14 Aug 2026 09:51:19
	+0000")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
	<20260814094211.25151-2-phucduc.bui@gmail.com>
	<20260814095120.235F21F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:29:59 +0200
Message-ID: <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_043003_389234_62FBEF07 
X-CRM114-Status: UNSURE (   8.37  )
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

On lun. 14 janv. 2008 at 11:51, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Pre-existing issues:
> - [High] Preexisting dangling pointer dereference (Use-After-Free) and
> double-free in the `meson_card_reallocate_links()` error path.
> --
>

Yeah, that was picked up before and it is related to the use of devm_.
It is on my TODO list

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
