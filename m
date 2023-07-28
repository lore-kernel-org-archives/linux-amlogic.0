Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66DC001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 05:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSn1CqsD5CE2mc4gJohLQ/wmwC5kbhNb61aVM+vr8PA=; b=rtOFxtfra7vY1B
	WjiIeFgKAIpASvXvbG1RKG68dJMxbqDYabuV0xFR6Z6eeaadfW1PuHmCMPAD65KVLXHM8TPKuCA+B
	kItnWJr53GDoinGIRqUI7WmNybPyuwk80qf0YmoSN1c8FqdOSgr0zip4PWA6sgJ6LMqzZ5bhii0P6
	7RtrgVTEEXZ/GLV8cPtnEBqn3UNZ7lPB0HwLv/pQe+Pgs6hMAb6bj+xSV2LOm42S7neWOAYbKNlZH
	nCCIsH/LK5RTQeYIV3WQPY8RXQZtct0N9N08673CNJ12uT/4g24rcqgmtRDgxKnHE2dYK9g4pOJsq
	4W4R/kqoloetxo/9X+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPG0B-001jJU-0R;
	Fri, 28 Jul 2023 05:26:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPG07-001jGz-0D
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jul 2023 05:26:57 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-63cf6b21035so11406886d6.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jul 2023 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=trpErXEJEPDZtUwJrLhT56jOvw/TASEnxJqiim24u87Ey219zXjICSpgcrZjP+hIvC
         YOisNcRp1EFcZBuqaw0v47KkdLVd0rFI+qxA+sXUlebSorcP7hGjMv3NkVKwxd1A+1fM
         +cPBg+wk6aUxXSizYt9OOW8K2HwaRZylnOeA2baYNkYAkyTSt3uSNK4bqSBTUKRlrYKH
         veSyepWn/C4JI0VyBkgwNf9ieJKzWg0hb3tCI/tmQqhFz8s1wdV5XOJi6PQyomubgQDL
         AUwaUxnOfbqg6WW2SXOJHHuKT2fULl3OjCF9EdNHMtPrrV+gZMyo2wDTP0lf87ec5+Bk
         zCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=R9K4arV05gLRUSi6RX8fi+8jgXBZ2KQjF1Mon3UY/ncuV0L0mMGIc3BDiL1bxU2gxc
         2mxgMNP0XTMsQ5ev0Vcbu44oWFTJTAiCY7zU+aBvJ+Y6bSlRKTw0dCrAIknU4n1GXJjz
         ILIdQrsbMVgGEdzl0mhefRhtaulwOIY50n1wvTREMPp1KcW9qdV2HnihYuTdf5EXOJA5
         ULLKyEMVAmDnD7xa85ERhoxC9IglqOcFZs5t/5LQCIGtQrBFa5Q1dBfiRe9m/Y5z9Sm1
         z1gG60FssQKdvC3pKtxWtNlkPBGHyqbv9Y4ikfrFAv5HD2lCaIaIbnMixl3/l9VGIGeW
         qVqA==
X-Gm-Message-State: ABy/qLYxr4xuvLrAygQC1PAqFyOwlf6im6qDniHw/rJ9C+WK6Tz3ucp3
	ltUkpL6zkHt2bl13pkIW+meIHO5llci5TuHTc1gn1Q==
X-Google-Smtp-Source: APBJJlGaHKu68l916QbJnESfurRQ8GLdxdUM6h1VlhU7qK1FfkFxQTpsfGqhPqGZxqp+5PbL922CfRISxETZ4hSkBS0=
X-Received: by 2002:ad4:45a9:0:b0:63c:fc39:3c0d with SMTP id
 y9-20020ad445a9000000b0063cfc393c0dmr1353378qvu.62.1690522009771; Thu, 27 Jul
 2023 22:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com> <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
In-Reply-To: <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Jul 2023 06:26:39 +0100
Message-ID: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
Cc: Helen Koike <helen.koike@collabora.com>, emma@anholt.net, linux-doc@vger.kernel.org, 
	david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, 
	corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, 
	gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, 
	daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org, 
	anholt@google.com, linux-mediatek@lists.infradead.org, 
	robclark@freedesktop.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de, 
	Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_222655_102581_AF133689 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > I did run into a bit of a chicken vs. egg problem with testing the "in
> > tree" version (compared to earlier versions which kept most of the yml
> > and scripts in a separate tree), is that it actually requires this
> > commit to exist in the branch you want to run CI on.  My earlier
> > workaround of pulling the drm/ci commit in via
> > ${branchname}-external-fixes no longer works.
>
> After unwinding some more gitlab repo settings that were for the
> previous out-of-tree yml setup, I have this working.
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Rob Clark <robdclark@gmail.com>

And it's also:
Acked-by: Daniel Stone <daniels@collabora.com>

It's been back and forth a few times by now and reviewed pretty
heavily by all the people who are across the CI details. I think the
next step is to answer all the workflow questions by actually getting
it into trees and using it in anger. There was some discussion about
whether this should come in from drm-misc, or the core DRM tree, or a
completely separate pull, but I'm not sure what the conclusion was ...
maintainers, thoughts?

Cheers,
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
