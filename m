Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6034EC27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7MV4y5iJmmuAJbm0NLkfbxJrnXQck6gC6ZgPQDk08Y=; b=aQkWXkzQyKHJqb
	KQHt5R3laB2JmKlH5dJ59p25p4L2zGjyPVmZIceaPyGS+s444hCbb1dl9vni/MOy7bYGR4FuonDGF
	9TqVvZrTZAElwgtwoZajziZ/RNavWJLbxe5scTLtN/X8b1QMMDt9ju6RUlRPD2TEcNIL4LPjq4rBD
	KqALcwKO/kvwX/QTlEfgaJ3Jns8kSuF+KybgRPsQusiXhAb6KyqnhI+94lEcTpjvCIsqU8G2sDSjW
	IFRtGzNy71/bSiwrdVf/zzMxof/Ayh5ZNzurcMAlQ5g7xDxYWVq4ujuYlhyE57lQ3zC9eXlBgHeDs
	oxONN5DVm7w5dlsxTYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcJV-006flN-V0; Wed, 25 Jan 2023 09:43:29 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcJT-006fj8-43
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 09:43:28 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id i42so7034363vkd.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 01:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCWq+O0xtWDJHVp9bnvZ8bZvWJE8EClyj5Mz1s1LVAk=;
        b=mUwAYcLaNrppfQcwh05lO3E3QaFdYZ8abbOiVVnpMSLbUgXnWW69RtPVAfx0YneHy2
         aDUwBPweqhpiqI+eXKojNHwb6jAQ1UryvMXXJCUsqw6Ts8b07tjIYZQrOZMNkG8hcabA
         KlgYcQNrrGWnsodJ4xguLCOWia2jAd62tbXCXMbxT/6IrQH3v8diJEf1N1vxDXc0NneR
         XJf5GaV971kcO4LWC6n0waLeh4cPPrYiip7Fi8t7JDL85yoNhWfRHBpiDaAMUN2AZGQY
         7aMkAQ9brYs+7voMxIe2UTOrYCXikCKaIuAb+pGXHHKzSbtn0WZb95JvkEalGlCJB6Ah
         WkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCWq+O0xtWDJHVp9bnvZ8bZvWJE8EClyj5Mz1s1LVAk=;
        b=2YmWua3QNHvuOV9DNUs4NOjwcZ9C9tXPbdH6oQPK++jJox7navdLW0IX3zLD64CCRP
         qUEQ8JM6wyiUuQAF01AFIka9un1ntDI2l7ZwyFDQeFe90SqKxQf00osmotRlxAkiA0hE
         meUjHwa4+MeG3gm71NEypnLtm7VIvYq8BNJlbvriAPmNvu6M7gN3bRrodsN3Vf50OrE4
         6OcgwCJs6cknOGB77r0GA9yv+lk8CB17V61mnjps9914GxHbNsxjpk3vuhHFBMJ1tE2f
         8xPpxIVc5EABCEl4A5cc3PBXUu33uaQhnkcoY5WQEy5wj6Xh+QzR2te2oSoJVfK0uxez
         BxHQ==
X-Gm-Message-State: AFqh2kpZGqJN50BWFPqhUR7O3Z1Jt5kyZ6gh9huU3T2dcZJRRAlMoRCA
	RxlkfhjEQVce1ngkSR6IGRUSUsjtRDAzuKln+Lk=
X-Google-Smtp-Source: AMrXdXtMVLT1VlTS1zRfr4VvTCh4w9CLfTixYp7P7YrgIEhZomqQqx1c9GChF38RhFcxN2G1ULW3+FtsbfY0jEDLQS4=
X-Received: by 2002:a1f:90cd:0:b0:3c5:db35:9288 with SMTP id
 s196-20020a1f90cd000000b003c5db359288mr4108132vkd.32.1674639805550; Wed, 25
 Jan 2023 01:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20230125072605.1121-1-linux.amoon@gmail.com> <20230125072605.1121-5-linux.amoon@gmail.com>
 <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org>
In-Reply-To: <bd29cba9-fb1c-051e-e10e-cb3e73ec5ff9@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Jan 2023 15:13:08 +0530
Message-ID: <CANAwSgRWVPghhEwvQgzQicJHcjgAv_d5nYfE0Ni90butc5ouSQ@mail.gmail.com>
Subject: Re: [PATCH RESEND linux-next v4 4/4] dt-bindings: usb: Fix properties
 for VL817 hub controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_014327_199545_47458B52 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Krzysztof,

On Wed, 25 Jan 2023 at 13:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/01/2023 08:26, Anand Moon wrote:
> > Cleanup by removing unneeded quotes from refs and
> > add maxItems to reset-gpios and fix the required list.
> >
> > Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> NAK.
>
> You ignored my feedback. Please help me understand how my tag appeared here.
>
I have followed your feedback and modified the below patch
I thought you review these changes see below.

[0] https://lore.kernel.org/all/df1c8545-01d0-3821-0c19-07a369e40472@linaro.org/

> Best regards,
> Krzysztof
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
