Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FB0C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3bXRsVbqUteY0/9rXC14T3EPdVFQu+jwIybTALYpMg=; b=kKKQPEA5tT/OwE
	ZPbv/o1SBtikzg5nkQP5qif55i7ta9FMFsE13lDaJYb/8Vf4so7RFuS76nDbxMLY/YQxF5pAyJBPk
	ZQdCxu9DTXJt/FtfkPftauijXTGgm3WDL8/AviMl9ottYfnJYt6UrAdgohaO5hxe/ekK101y1s4Dz
	gWhlUJxi3dQvM95ZaurwGi+A1Gn8JEJ55sOiqm5j0lO3LcithiEQSgFZ4763freqtMZQLW/cq49ow
	9L4XYGFVr7+qUV0z+/aUQffkOFba7wrBgkAzH5bm5QZT9BgV0DItF0TRE46vqyvZBeCF3iYKN61/e
	FJNuHNeF837MP8rTldMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPV5a-0042T3-LR; Wed, 02 Mar 2022 19:56:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPV5O-0042OO-7t
 for linux-amlogic@lists.infradead.org; Wed, 02 Mar 2022 19:56:36 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so1650990pju.2
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Mar 2022 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CWC6CjhKIR5QPsl3czUa1+r5EgkVSh0pl2OgLlZsLkE=;
 b=bZWOKYcYjBohNlYL+dSVXWf5eDaIfaHzXf8/RHn7EkS9sTV39m6wtx1K0m+b1sJFaS
 4NVhTo/BkQl6PkShoKVyo1rFA4BIPYl1E6xkqI/CIBSLVsF3ojU/opihHIWJO4gBWROM
 mUaLEn4ftuv+MJ6EMatCxQT35i33UUXr+cdciajbP0IeoxxaOrRj0oIcw7jRsM3YDccy
 OEPENRz3KuBDDHd9l5JP7J6jV7+25i2922He9PRFkh11kL5FCO03D8ANWfWHws6mHEs0
 RVVZlvZkIoT3z4CWpMv0eaQap5woeLgJnug6sO77gHig7e0gWRGexmn97Bck/AIBhnmY
 L70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CWC6CjhKIR5QPsl3czUa1+r5EgkVSh0pl2OgLlZsLkE=;
 b=WxGSKjgM7QcNjBiDNIsHyeHobrL/bTdQLPosZzDWCU+1ebt/JfQf30sFWiRHtInI0b
 c3mDt4gV21HxDVuFaHJ+2g0IK0jWMM5c9zljSvSTuJQNd68j1Y+7E/rq7c7X1B9ZIfCl
 ljntGhHc6EcU1Iw3EocR1awpivxkPax6l/dQoHDr3ccZmTrvaKQSOxtR8Whpgj2oD5PN
 KX9s4TujxNbOja9QUCRPd32yPXUdxEKWHmMIhUNAGYEoBW0I5qQ3urfPu3dlKM2Lv9jl
 4wJNXlCM7tGLGJeRwRuilJNMxA6qYBHi4fS4HJZdQKBVUCGj2q0NrquTcMK90RO0CPnv
 KliQ==
X-Gm-Message-State: AOAM531aK0EJo1pWQAIGyOWF8CK5fN2I+W+rSRYV1L1l3J3/KGxQ/qDx
 ugS2yHyXzLlIUmfqL6uhCP4ASA==
X-Google-Smtp-Source: ABdhPJxMMHIwBctC3bNbdMAJffHE4f03N6w1ND8f7XFoeJSCeDus7QjCWvCtxkhKMkaWpFIwO4tZuQ==
X-Received: by 2002:a17:902:7204:b0:14f:b325:7658 with SMTP id
 ba4-20020a170902720400b0014fb3257658mr32259190plb.110.1646250992419; 
 Wed, 02 Mar 2022 11:56:32 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm8124548pfh.143.2022.03.02.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 11:56:32 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Subject: Re: [PATCH V5 2/2] soc: s4: Add support for power domains controller
In-Reply-To: <20220302065540.16031-3-shunzhou.jiang@amlogic.com>
References: <20220302065540.16031-1-shunzhou.jiang@amlogic.com>
 <20220302065540.16031-3-shunzhou.jiang@amlogic.com>
Date: Wed, 02 Mar 2022 11:56:31 -0800
Message-ID: <7hilswgmc0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_115634_456289_27106315 
X-CRM114-Status: UNSURE (   7.18  )
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

Hi Shuzhou,

Shunzhou Jiang <shunzhou.jiang@amlogic.com> writes:

> Add support s4 Power controller. In s4, power control
> registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Please investigate what is going on with your mailer.  You sent 6 copies
of the identical V5 series yesterday and 8 more copies of exactly the
same thing today.

You also did not summarize the changes in V5 from the previous
versions (e.g. removing some of the always-on domains.)

Please collect the acks/reviews you've received and send V6 and
summarize in the cover letter the changes made from pervious versions.
Also please send a single copy of the V6 series. :)

Kevin




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
