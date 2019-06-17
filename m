Return-Path: <SRS0=61JF=UQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4EFC31E5B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2019 17:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3733620861
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2019 17:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cP5myP5i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iir/cwro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3733620861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3yuogXdQ5SyrDvV19VTCtHnVb0LEPFqV+La2W4ASow=; b=cP5myP5iA3v6Ru
	BW7v2xSV1kdJGkkPCjNNBj/B2vG4dFD+EZCHtBPChLHAbF0ISOk26jTTzluQnRS8tFvUIrJvNI2qV
	cEQ+maCqAF22KVZno51ajrvDsvVWnQ/fAQy3CCEGoJTQi/SyuMb7CRXakXK6hnhDwHWb6GKInIZWD
	tQZtp5aPdSoBILYNYUVZ1uVBNGbTxfSXwG2PHhA7trFd0Ohhn2vcEWrKinOHqARk5YWNFov1W0CEo
	eZsqHap7WygiNPtXvimJkmmlth+Zyxd6a3HBXKor8wmmV61zaD4+YjRNLzDuUWUMTw+fqtdt6S7NR
	WAWOyW5FdylE6gSrsL3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcvti-0002Om-H6; Mon, 17 Jun 2019 17:58:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcvtd-0002LF-T5; Mon, 17 Jun 2019 17:58:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id s3so353489wms.2;
 Mon, 17 Jun 2019 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=iir/cwro3Uo0pydX2p6MssHcUcKCWLi3F0aRNfT9oiuPoCu3KzQi3D++TfCMCA5kbq
 UhdVsSno+MyWwqU7UMla2YRrjl3vooBFlx0nKtYTh44mvlxTjTeU/ZMsoTFT3Na0Nbo8
 zbXVWPc9pfLCEz8akgJpe2z9seqCP2z2haWgAfsi9/bgn50zH7bOZc5jW9vXW8SMk4Rt
 tx2lTCVIciiKlEe6uGemUYOgLdxEayja9E1N+noF29tOg7VjKlKwytO7pxFuV7oS4QEN
 rJlpCllgKrwVj7eJfedrwSjRfOJSjzakYsBlPrwpP8+Cypssx+Hl6JwcIa7W9QWRzmBt
 BA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
 b=We5TqLnoL2S74KM+srp20QyiaEhmiLWkfwIflKwYGeR3mlLziNGl8XG9t6ORsf3wSj
 mt95Jx9ufV7VAjG6gUgg/Jq05oo4d4ZHPwaSiItlFBCsLPd2JcqU9zs2X5E7326RJNXJ
 jI03cJP2u3NrjTDSPYJNMJe9O+Yl4Ln3QPseF7KHN/xihZjGa+qdJqmLzhtL2tkvLAG9
 gJDkcAvmfa0wZCEbbWmNDCgwbKSedd2CfAFFkdRdjnGj3HPniPS38f1UwXg+5L1cCE1x
 WQ23reWcX2+nBESCwlYKeLTkVS1ZQj8yuF+RrdZca3bplL8XKKE7ry72PL/lhLfrXhrL
 K0Eg==
X-Gm-Message-State: APjAAAVXqxGjZZWX7mQc8avN0PNN8dgUuLdx0C8/wSrEI7mDtql+EqBV
 8fW/gknAiPWuQT2/dNPrFFk=
X-Google-Smtp-Source: APXvYqxzwMRI3pC9nLxx+cmi8fX06IrtlUhdDEcmz2BcTfXpaVk8v0SGvmPS+vZF06+nGUJcsaBAYg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr21050453wmd.116.1560794289646; 
 Mon, 17 Jun 2019 10:58:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id s188sm13333537wmf.40.2019.06.17.10.58.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 10:58:08 -0700 (PDT)
Date: Mon, 17 Jun 2019 18:56:06 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 06/59] drm/prime: Actually remove DRIVER_PRIME everywhere
Message-ID: <20190617175606.GE26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_105822_014404_29614E58 
X-CRM114-Status: UNSURE (   5.42  )
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2019/06/14, Daniel Vetter wrote:
> Split out to make the functional changes stick out more.
> 
Since this patch flew-by, as standalone one (intentionally or not) I'd
add, anything vaguely like:

"Core users of DRIVER_PRIME were removed from core with prior patches."

HTH
Emil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
