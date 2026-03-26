Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92876106F309
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5C+fKqNJa4Amlbl7GZw4puFPW5h2ias18Gihb/IKM0=; b=iHn1tPDBzqNorb
	G9eiJvVtzytSG9wayplvcax23E0ZwyUQ0iiBy9dgr5ZmiKNpl23I0DFQKRjv+gc/+ZGbU5cJcKE1z
	2v5b8ImMKzGR51/9xdxYn2q8XvaM9gPI1GHOwoLxl6BYHNdpN7uF4PqGtGGX8Fz5VCPmUyiOex2ym
	1LPIxc2pYa1o8gmP347A4ChN90BrsBC4aSSutacN2KY5Ubb5sD6mVNUB6s5VqEHuyDmlHR7i9+UWs
	t+hdIYztaftXua7aJdV+3yIn92x/wwEUwbVl0t4q71bcKzFo2IU2nP7iIaQnFhW4b8lEZTw3KoDGD
	OwL9NV8nNIfNZA5q/deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfq-000000056G1-0ehX;
	Thu, 26 Mar 2026 09:06:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfp-000000056Ew-0Bvo
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=; b=XhWk6PEsMnCBeL7DVYrs2DD03d
	zP5jOrAxMMUJ2ObeV5b9OTSTkvPE8QWv31DQ+x6AVqhFxZ98VZE6xHGoa6Phi6FyJFJzw+Kcea6QM
	no5+JesdlK1KzLltyjnIMLF2Q4AQWZknhA4zdMyxQhRqsaigrXGHp+tHyw0jBtTtTQhTawUT2tiam
	YzXhBNjmQYbTyDDaLawNuvYbplquby4S78rJ0j/vdORlXc799t9XJzwcnjCTcpfhQGbn2jYg2EKXi
	5UHQgmUohtgYmObDR668UTkhiqMUFBbDfIEPPwe+c7BFoYdrBVVFP9NnCHz4iDDh99ydnZ+lQVwTe
	A8dZFE5w==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfk-00000007puN-3KZA
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486b9675d36so6493675e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=GaVGJZu2fq5/T0tBF2voZJ1wKd67jNWxcRaxcw/0LWN96q8iCBptO5BONfuwanboEi
         bB1IK451xaO1PGKCnYN01rhpynpDuJV2brZsQlvmPDAF1v/6JoAfSI6tht6TP2Ii6nrs
         sBGzcqwr+aYv66wrUtUTidjUlAZ+/5YhefBEozMldCtD7JIQqUQpL230NOyQjEdZ1an8
         VMspNczjESiWPacQaH9KZsu184pgWaIOMIk+zVCBcctlMXWUn6sMuZjoxf0JgoUshVab
         wJ23yLDFQqNAkZQc9ICxuiiqMbzpEsFW8tioBVLGXygcSDqbo5errnSi5sVEZgmGCVoK
         o2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=iE5ZvQMiR0A5r5FS91ITGCCXaS1/y9uUsLVx2waRATSDKXZ/6FajrbiW23HKGo2lCy
         AsvobDFmHB0fTfqxIhy02TkZNV2g1DMvwLQrJ/7YBxviybbizkUo8dGgbaUab7wb4yl1
         6W8ZrqaPfeNKvi84lKAHvLxT1uA5qOuUjnzg9nlNmhmAHZe5hhuqWWJClZFy0y0dXoEn
         wCjaaozfVUO3deuaPzheckvj36PeKEOzCLbRRTnA+TEmBlMtaSFn5MVUFsOZWaxydFpo
         3k9H89GKnjZczSdQpUXGrGGymdn4z4VOsoimGhQ8pgANrpa5Nsx4YsiwTPPaxHizPDzC
         se4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsyomgjphgNyRF61YR6FFcKEVGo9prFrLzN5Day3flFEbwVtuHuklv7Ozolnzmgpgxc6J2IQbkRJexQL58@lists.infradead.org
X-Gm-Message-State: AOJu0YwO3j6qBZuakfoJCB7GGR9iPkB0vO0PbeUwcExnLkWqYAu5d/x3
	sePN/mgWEXZnINuEkWFBAzxi9q9gBFUWhEgqYc5avuYAKI9v+/eoquCW/kOaBsjIiw4=
X-Gm-Gg: ATEYQzxJvuiND1HRRaxyKHz6Ddl/YTIGu0tGSqWBvcc57IC4Fckgp4FnwdwfO1wAqab
	LBomDsaSowLskoWoQONtwoadwRWYerFUMwPbQMXItMeKo5pSsYuz7i7tzTdiEpR+s+jNQ8v9ZXa
	wLKri9QIbB5is2o7FHpi2cbKb7nxuIbmGNifMlVm0D7PZ5U0IhxAPG8zB/M5ocwdzKmxaGH6H5B
	1SSqOSWaR76fR6ATp94S55CtVimTtDF0xWdxkTU616198oJiwHcioDplW6ylHAtnspQgK0tPMVQ
	CZ1/e4JjWZxNHIIohmuDHClZ68Rlhi2Aah0yhec+/nfihW570YKr38J328tskyLuGqO78NhuCW2
	y2JkUNBc5ssMvNIXTLkPgRDJnvAqppklQ39/5c9UX8W61mz+89QB3hZsfTvYmf2HzILGs7BVi8+
	FcyCc70n8wvh5RcXDXs6p+EAnd1SVSI/p9KXcN+2ywaK+awbteb8rCwf4=
X-Received: by 2002:a05:600c:4baa:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4871607ac9dmr52495635e9.33.1774515995000;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306030756.2421841-1-nick@khadas.com>
References: <20260306030756.2421841-1-nick@khadas.com>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix board model
 name
Message-Id: <177451599416.122020.7359168833224163139.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:34 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090636_959569_46402472 
X-CRM114-Status: GOOD (  10.47  )
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

On Fri, 06 Mar 2026 11:07:56 +0800, Nick Xie wrote:
> Update the model property to "Khadas VIM4" to match the official
> product branding and maintain consistency with other Khadas boards
> (e.g., VIM1, VIM2, VIM3) in the kernel tree.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix board model name
      https://git.kernel.org/amlogic/c/771d092af02a11ec565494052d18ddfb5e2f1428

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
