Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D50CDB467
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jun 2026 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqkSI17HCs9pQBwQZVgc+0w0jg7Y94Hp+Q8ClRA3VFw=; b=tRGVq9QnRz2Y3y
	XqeJDNgW8q867Xb3lsQ/BuBg2rSoGDRi5unVhZlkpPThTbgEOGEVkv7eRRP6WrGjf7+zF/KlcKgmY
	w/MAcLPWzKeG7zMxDp3iydYvTuINlczLv0EO1VxZCSVz2NDz9Br6UVEaDSqAyXEaUBU3VaIToGpWF
	O19eCQ04PertcmpZm9S58fRyWPY81RHcs89EZ3iroWQIn00By+RwbaAlqZAjesbVyfxioBT+uyDbN
	5MW6MkWlAu/NJeMTrhVsUpvxR9Kjxi+BYdwTdILycM6i0DGhLLbWoLLvncjm9+buwKFedN4DuA+Qu
	B24UTDPVh07kglfopDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTfr-000000026rB-0C34;
	Fri, 19 Jun 2026 07:29:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTfn-000000026qN-1fvW
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jun 2026 07:29:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so18743255e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jun 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854193; x=1782458993; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=e6MCCajNoxZx9HaQbSvOPnpNxRPH8r9hiDEYulihHFhn2Tu62+3Y6OLTKdhgZPnB+v
         mxJhLEZCP4W3JG5b1vZtVTTbAyQI4JKiXq1MY+nSgdjpGXaiFTfZfp2IKCg775pEwUUE
         ftL/NYv7sTifq3lpenFVO+UbnqQgS4H+ZsCs7vLdkttqibo8VDYLNQyBFxWaEuSsMQz8
         8V9FSlvo5icdxg19GgZnK3AvoxxH5gmSCPjcC22uxeAaMbI63Iz+4vz5VF/oz+r9vejy
         b+x+5Pp041AQqQG1JyekkfSS/53SHqU0ADb3EfUBP1LIPfFEpp1/8tkfvPPYWpctZFT9
         qIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854193; x=1782458993;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=F0La6xCedZpKt/z3wMMEyw97HEmwflJThl0kt7WAZo4u0+mGbVt9OlqOesrlgZ3pN5
         DNb23ttOP3cpxsZikUERBxIWE+Uzw5eNsSBHqdY/q5Y76Reypt0mxAeIpxRs8sB6k11I
         03ZQ6OxYAZTsMR4ivfectqXFbwSPMQt895VfAKzWRnMyauA/VcSH/IVi4M9lXuCg5yL2
         bUYwZywywlfk4utwJaudLa5FBb1DlHgiX+UWLuJtE4bgapRO/fmT9u8Pf2+82cuJPxte
         78LsGg1z4EbJrqDTDWZLiJfykAkKM5VbFAaDxtitOyUkQxV+VDrJUsigCDaxQ9ksLxiW
         KBBA==
X-Forwarded-Encrypted: i=1; AFNElJ8O8LptXR9jnRsEYQIcXQsuGyvrgpdq8aNCJOH8753yidyaNiuYUwLdRjzNanU7GseARqtCfZUGIEUam3pj@lists.infradead.org
X-Gm-Message-State: AOJu0YzkT6FEYIHYPQE3UldNk7CVa016nH9EaMNG7cZHkiGMEkC2Db4X
	31bbVYHEod0W46+RAvBMxEpdgyMbFdP3BoOSouVBM9yOhs4IzXakMztwuP7YopA4VR0=
X-Gm-Gg: AfdE7cnK3MPU/R9PizsZIAcdkx5kS3YKAtpLBDkjsgKksEDeX3Io4mnl22SLiDT2Pbs
	hAeO58EmfpztpetbD1sphZd2ZRdIVN5jZyd4GGx61JJVDhW+7FLzho3G959L/xge7RXYYZOTs3f
	1Nolc20dU0m+kXBnWfs6FKs8gfvi0KCKXRHQ3AFv6kb1Q3lA/0CUnhQP1srBPZxbzI47VtS1YTH
	cURrNP5TXJe0a5Ixo8JTNuSNjabzgYx+fFcAz2Bw1/1SI492HY/dGGqDDOwHQ0pG28EFtijoowQ
	EYxEBe2JfnzR2GssGKNHSW+exA6QLM1Pj6ptcUBMwb8Nn4nHEtSKzxIedcpOUgWlTaLxX/fVmyw
	aJcIKdo0wtq/79WGCYW0qgm5Eg22J7bPba7jZTndh6QoTnBxAjpZrCF27n37cVIWYp5cd44cJXi
	fzxNGvBgIUYdw=
X-Received: by 2002:a05:600c:46d4:b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-4924257c483mr21687735e9.27.1781854193037;
        Fri, 19 Jun 2026 00:29:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd30078sm46219025e9.7.2026.06.19.00.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:29:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com> (Julian Braha's
	message of "Thu, 18 Jun 2026 19:56:12 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:29:50 +0200
Message-ID: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_002955_456717_67A5683F 
X-CRM114-Status: UNSURE (   7.79  )
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

On jeu. 18 juin 2026 at 19:56, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jian,
>
> On 6/18/26 10:49, Jian Hu via B4 Relay wrote:
>
>> +config COMMON_CLK_A9_AO
>> +	tristate "Amlogic A9 SoC AO clock controller support"
>> +	depends on ARM64 || COMPILE_TEST
>> +	default ARCH_MESON
>> +	select COMMON_CLK_MESON_REGMAP
>> +	select COMMON_CLK_MESON_CLKC_UTILS
>> +	select COMMON_CLK_MESON_DUALDIV
>
> Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
> selecting COMMON_CLK_MESON_DUALDIV here.

No, regmap clock are directly used so this is necessary.
Relying on other module dependencies is not enough

>
> - Julian Braha

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
