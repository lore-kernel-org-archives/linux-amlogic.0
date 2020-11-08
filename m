Return-Path: <SRS0=B07/=EO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41111C388F9
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 22:11:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FE6206A5
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 22:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tyWRwN5V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ose11JQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FE6206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lCWyp0PYuaAwB0nB0GmtLfZ6me8k2bSJB1D3sLvncRw=; b=tyWRwN5VUFFs6OSnhU5KxE76p
	j2b4uXBREQ0xelU1Vcr4RdFOuJhctJ613u0BrPot/DfrxMnbBO8ldaHgbvt7k+KWPfnRG+w5+B+05
	tXJYM5gEgpy7uvBHdKA6yp7juKLkbpCJni6OTTdvC2WabGUVVglYtUnK9AFTdmBEqi9TWX8kER02q
	UQGm/5akoJjFksO7BPCY6MnLSly5AMrERExce8shaDRP1Y+1lWDw5qqIUxCUXJr9RsoR2zEO8slwF
	Zo0noJaQx7HpF06r+1IEtuv5oLAb2UxyWPt0Ue4/xqxrcca1KU6c19s5P9BVr9DC4dPH59wpcoqNg
	7AYK34HLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbsuC-0008DY-Vp; Sun, 08 Nov 2020 22:11:25 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbsu8-0008Ca-56; Sun, 08 Nov 2020 22:11:20 +0000
Received: by mail-ed1-x543.google.com with SMTP id o20so6746568eds.3;
 Sun, 08 Nov 2020 14:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQW9OKeiUXYbQry4sNj3otrATF5lu7Sb8UVFYJSJ04Y=;
 b=Ose11JQZQKZ44jTrTvreBQxy4dKe9ULvwGFigLaVW6YJKWfeP/lc5w3J+xTeuos7Jg
 g3dnOtMpDmfNvj+aZ35fMCUZInJpoSwXhAzWjPM7ghKcwUGC3ONa/OLdVKUlh/NC7j9i
 tLcWnUpliAt8lfDjzdQwIAGiuxrnwbeNOKnzVduabNJ3HrKq8Zf3GqiMp/sQvwteb0M+
 4T1AFjad3THIPfh2TCidVSt+5baTMIUZxEhQ91k26MZvvfYV11QowKumDCS99rqOZA3O
 p157YXNhqyHGj8546duSm/OY74Ekq3t+MNLb6PC0P0N4KbP1rt9E0NfiQNbkeT81rGQS
 +sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQW9OKeiUXYbQry4sNj3otrATF5lu7Sb8UVFYJSJ04Y=;
 b=p3RvHhZwnO8CpWA3AVfb77m7FBNDdFhbWXYSaqNBNli6FHST6I3pkdn65LfTmS5yu3
 w1Qg9sz1MOYXx2O+St+zk8+L9qDdWeVNNuYoAFAFOg4aDMXKZHTgcC8Ed8EQo+Tkfl78
 IfgKJMV9EtocYUFXbj0B+wePJJeJ6qbacOP4UKgJOSItw+BEAcoVX4E148x/H6+xLlC5
 byHcFvEysBuvRCno53VvY2oTLaUVXubZokW7fa4xWeIow+gSZqGWxMmJOpcTAayUC+qS
 PmtDnB1uriL0BkqrOm/vBJXNL6eeQy4hif13B0x8bZWPI58zbiPzEc6fmK7IAUoQxMf6
 cOQw==
X-Gm-Message-State: AOAM532EU/wSZQo9Z171teN5XzoWCOaUyaRTYr9jPSIf/SoCZRsupTwQ
 i/roZN1EJolJ11TozwNTGhs6XilZu7m5Pjf2T3U=
X-Google-Smtp-Source: ABdhPJxn/TUQyzh6+DX45a3IbFyU0IhAwdKmAtLx6F6Atgx8uZkRWU9ry1zkd7IKk/r7RxoEvUq6DLrR41bkR8B6XTw=
X-Received: by 2002:a05:6402:3d9:: with SMTP id
 t25mr12720413edw.338.1604873477430; 
 Sun, 08 Nov 2020 14:11:17 -0800 (PST)
MIME-Version: 1.0
References: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
 <1604642930-29019-2-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1604642930-29019-2-git-send-email-chunfeng.yun@mediatek.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2020 23:11:06 +0100
Message-ID: <CAFBinCCdYB0YhbT-sDe3-g+CT_Lj+7jRY1dXcwDHucVBTaL7CA@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] phy: amlogic: convert to
 devm_platform_ioremap_resource
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_171120_205986_5721FA78 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 7:09 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use devm_platform_ioremap_resource to simplify code
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Remi Pommarel <repk@triplefau.lt>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
