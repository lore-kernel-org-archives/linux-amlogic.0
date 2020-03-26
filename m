Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C73C43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 23:09:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789D720658
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 23:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fME2Gk8d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MVcDwGSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789D720658
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6zvY1R2PbWBlB6qZZcgUoljS3GoXZEtBl/xW1zJHv4=; b=fME2Gk8dhoeBJ6
	t6gUYWpE7tcVzVmJ0EmWoU/gj0///Ik/RsArBPty5tjEYJ82MkM36daVhEDoxO7Ro8tWOftCxbMXA
	b74VuDimfsJmQOjuvy0FzFaKGa2blI4WZqEX1XljZNKv3lqjodHIJa5fV6QBKc70RJMAvHCs3DbHt
	ticnc5lZCdJyOHFc/0yeMB0gRUSXHvXfnWW8bZTAAuOZvyMgZL3n5PLSgWiw3HmXJh8LudhUGiXNu
	/B+zJckMuEcAiofuoijlulJRCom2rSeOUl5rR940XLGk2tBJ01JOKBOc9w8rn1YjcBTTJd/iV2EnC
	YcnZ6QbvafL4Hcbm9ABg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHbcK-0003fe-1U; Thu, 26 Mar 2020 23:08:52 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHbcH-0003fD-89; Thu, 26 Mar 2020 23:08:50 +0000
Received: by mail-ed1-x543.google.com with SMTP id cf14so8932289edb.13;
 Thu, 26 Mar 2020 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjVmzAATf62uYEZGFDdUMmZJw/Rys56Qr6VbgpTrVUM=;
 b=MVcDwGSBB+EFkrtg2gmqZWSXAq9mYwRWCEI/YzTHcuhAVWx2S83wHDdVNOT2k317HO
 I58EWGrxVervRYnIEjlAPTboaD2fUW4UnujQzjxOc/YD/KuKUfSM0YPfJ0kaOYjctOU9
 iLGd1S8jxJh0FNm2TCO63sBqyLxA9gvTQ6lM3Kxy7/HWrPCJiXfkoFOzDf1Hr2TDsi5n
 kJZylePdzvNfkiHQhhY9XYPnnfQz0f/bP/0pK1Q9B5aC/cLdpgeEIfBPXCNIqpbG4pBf
 l4c06yIRKxwuFcM4kYo0VFj4i8x5CeS7aif1AeAVOFIFnY3ekMkSxbJTtK/n0XEHXNF+
 VbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjVmzAATf62uYEZGFDdUMmZJw/Rys56Qr6VbgpTrVUM=;
 b=ZHt0N9w9VRmCR1Pz4Wvd4hGmt+OUdCbD8H0v2NrvYm/8yc5e+fie67HC/utJP2Y5/D
 bxzkJjtOJnLsfH2r34rOn+iuvL48d2ColKRUKwbEHlJ02FoicZYMzcLhIo/7T4hrUn6F
 /gA2Mf87pVgTx1D5R3ToHIVMzW7uT80r29ZqVYpggm2ZRTMqTtgUWd1Y13RNRA29jLes
 1Jg+NHc1QxXmkj5su0tALGyTvlvRXgJ1rJVsFhPSbuAIkkB0IiJQpSWJ991GxxLUs2GQ
 FksCvNCjuyds6eVymCZsV3PbTP64dHvj/pdMGnkO9p/3xAQh8t8GPHr1tpsztAsaewcO
 9uPw==
X-Gm-Message-State: ANhLgQ0HVPTLen6i34bz9C/yq4zwbk7Mv1khnzljwFr1C2BOFE7R7zh+
 f0zB4OCYZjZtsuGHHwOzrV8wEsjzskIah8Ka7CY=
X-Google-Smtp-Source: ADFU+vtzMTlvDFueGZkf+gigtXaPCQtDw5qM43N1F3qnk+rE96BbiGe2gqw9PTPkca4WmE7xjFnfdD1Mkjj7dwNdgb0=
X-Received: by 2002:a50:9e45:: with SMTP id z63mr10637427ede.338.1585264127824; 
 Thu, 26 Mar 2020 16:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-7-narmstrong@baylibre.com>
In-Reply-To: <20200326134507.4808-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Mar 2020 00:08:37 +0100
Message-ID: <CAFBinCCVTP+MrLq1O0m1pcvLo6WSXyXpTtWMEQQxOuraN+yA0w@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] usb: dwc3: meson-g12a: refactor usb2 phy init
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_160849_315520_39355D83 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, Mar 26, 2020 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Refactor the USB2 PHY init code patch to handle the Amlogic GXL/GXM
> not having the PHY mode control registers in the Glue but in the PHY
> registers.
>
> The Amlogic GXL/GXM will call phy_set_mode() instead of programming the
> PHY mode control registers, thus add two new callbacks to the SoC match
> data.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
checkpatch reports that five lines need to be checked.
these all look valid (for example: "Alignment should match open parenthesis")

with these addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
