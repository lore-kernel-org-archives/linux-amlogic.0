Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7CFC53200
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAbv/A9+SR6y+YCgDVt5w3sr0fGpvolv1oLvl+6p6lE=; b=s87D9tcTopHZba
	egtbXH2UwUjYh7dsuEFQw0thv3u+5XyeS/md7wR5IDY8Oq6EkqoE3mwfU1FDZ8VB0a30V3j+ZL+fu
	6bZqHmjh2lWEi2ehrTh7vOksoyH1TaHd5fg7++Twc8o+cv/tFQqPfKYjH+cGzwj8KkXiyFl8M3Npu
	EocpYKuK00tT94wJh8MYnhroGFYjtfSEv0EJL42LdIIzxbGkovAFPm3GUB/SON9LR9vd0ulm4xclf
	a94VhwTGXlXpUXqAzUCmeK/15H7SwIEtAodKPuxrN7Ml2JxhEsDNqL7rnuLr/iw+b35r3FpAc6dL+
	mFlIzAfwqC4F/jjYqPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Rj-00000008kJc-082O;
	Wed, 29 Jul 2026 17:51:59 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RQ-00000008k8u-2zLQ
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bdbrvf4m5fhfffknshqtzcbnve.protonmail; t=1785347496; x=1785606696;
	bh=Nvabop0zm4uonzH0zzDptm+Kpsf6ujwvdHILYs5XWCY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j3y7A7OIV58ZSQvK9RNzYnMMOrH9H5g3fVumitLIXxRBNi3uqPYKl+7pkhZaU+2pC
	 YkbRDMmB4XIMzYhxirZlj3xs6+sPez45sE/V/KVwYKmH5EAF0k758sc2nu4vhd7P5q
	 a37oPqBr75CgWZtnCNwdkq46J30nHktpYQJ+uWwrBfgTZsLK06gSxYEt//lGrcCClt
	 SJoN332C2geB1MYjLx2b8BY2Eae+jD/Aw6fBKH3jE18bJqJGxQL1AGwSEC9aEk1raP
	 nhCBVjfGgCvnSyKdmOfExTVyao4E1N9aKOfFjqKghdGNoyXJdbYBGju2EWx6PV7BG9
	 Z43O0nyKro3+w==
Date: Wed, 29 Jul 2026 17:51:31 +0000
To: Ferass El Hafidi <funderscore@postmarketos.org>
From: Robazza Alberto <robazza.alberto@proton.me>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Message-ID: <XEr1g-aJeRsEJnbiy88DnzHi1_SQcZ0yL50jp2uYuQsQDw-eqyTfYI3xxoeVAWw7rVTwTTNPFGzA5FZBXguG5DAay2isJHh_RktUE_LWSn4=@proton.me>
In-Reply-To: <tiy37g.1ypi45yn8qibx@postmarketos.org>
References: <20260729141234.65037-1-robazzalberto@gmail.com> <20260729141234.65037-2-robazzalberto@gmail.com> <tiy37g.1ypi45yn8qibx@postmarketos.org>
Feedback-ID: 89419976:user:proton
X-Pm-Message-ID: 54e220e002fbf84dc033cd47950f2f0f59679da4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105141_395353_828F6E48 
X-CRM114-Status: GOOD (  17.47  )
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

Thank you for the feedback. I didn't ignored, indeed the suggestion was implemented in v4. My bad!

Regards,
Alberto

On Wednesday, July 29th, 2026 at 18:31, Ferass El Hafidi <funderscore@postmarketos.org> wrote:

> Hi Alberto,
> 
> On Wed, 29 Jul 2026 14:12, Alberto Robazza <robazzalberto@gmail.com> wrote:
> >Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
> >3D depth cameras and embedded vision boards.
> >
> >Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> >---
> > Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> 
> You seem to have missed Krzysztof's Acked-by tag in this patch:
> https://lore.kernel.org/all/20260729-unbreakable-observant-clam-ca4f6d@quoll/
> 
> Reviewers will typically give out Acked-by or Reviewed-by tags to your
> patch to signal that the patch looks good to them (typically the former tag)
> or that they have reviewed it in great detail and approve it (typically the
> latter tag). These tags need to be picked up and added to your patch.
> 
> If you use b4 to send the patches, you can run `b4 trailers -u` each
> time before sending a new patchset revision to the mailing list to get
> all Acked-by and Reviewed-by tags reviewers will give to your patch.
> If you don't use b4, you should be able to add them manually still with
> git commands.
> 
> If you don't have them added to your patch, it may sound like you
> ignored their review. Reviewing takes effort and is time-consuming,
> so always make sure you have all of them added.
> 
> Also see: https://docs.kernel.org/process/submitting-patches.html
> 
> Best regards,
> Ferass
> 
> >diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >index 396044f36..a42899bd2 100644
> >--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >@@ -1251,6 +1251,8 @@ patternProperties:
> >     description: Option NV
> >   "^oranth,.*":
> >     description: Shenzhen Oranth Technology Co., Ltd.
> >+  "^orbbec,.*":
> >+    description: Orbbec Inc.
> >   "^ORCL,.*":
> >     description: Oracle Corporation
> >   "^orisetech,.*":
> >--
> >2.55.0
> >
> >
> >_______________________________________________
> >linux-amlogic mailing list
> >linux-amlogic@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
