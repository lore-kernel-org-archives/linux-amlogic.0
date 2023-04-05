Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B72BC7619A
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I55VwWcT06AXCc96p61RFuS4F7TGKm/zOe3jwA0OSFM=; b=VivCeZir0d4Rp6
	3r9WRm6oTnE+CiOkxn9pRP/JkEs5CgvLiNLx6ghcoj6s676l9n4Ej+DVTVdislNbGyjGqlFJYrfEE
	U9EppWeCmutr0HFNwmbdKfXFNlu+FnWIFNkXQEwaoY3x6bQTP7HbSF2v+ubr25zUZ4OfKitftkD1s
	UHdHTkAO/htgi9T+no0aGi95kpq0qI1w7B7QSgpXlxLZlXVI1ZxJJCMD+a44tTr9cJb5x9c3F9tnl
	nK/ok7mGj5hI3i/1SFic7txRp/4GesYAVGh3Jq52RwF49DGPxXs6hQihpCTBowt/kMQWaAqQpyTOX
	0OYEuwhdN3o1NUk6yw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk820-005PlH-06;
	Wed, 05 Apr 2023 18:38:52 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk81w-005Pjs-2e
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Apr 2023 18:38:50 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-545cb3c9898so618893927b3.7
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Apr 2023 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680719921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=96mMO5VfJymJIg1MTANPgIUd2oRzVUUEM3YC+4sy0ZU=;
        b=C7pXO6K0bRNO3mXV5wy061iPFaoxlE4dcFSM2OH2pAsm9yEr2vroEl5UBxsIWm+3M/
         CSO8GYILdnLqTkzm2TtGr1hV8jeDpIR01SjT1NFmlglYw5rRQpZzz+B6lYBh8Xl0mAMZ
         WNECt+3MzZxMC5FlDIVlBhkZ4siLZSvArbdbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680719921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96mMO5VfJymJIg1MTANPgIUd2oRzVUUEM3YC+4sy0ZU=;
        b=hakqYhsAf/EEs/BKNY9IhTfU13t1YBqwv5xGernJ0rlkRza+ghAY6XCl4BROn3k9dU
         Zn9rDsi3hSN4PDrL2ds1Q7BH9Z3O4X2WSvZCZR2WYGVk6BzIm/FrN4eQRWowlP/x8XCz
         3zyZmK3pm2Yw7dMy3BIr7OimDlNCaO0q/iHdbQBrMEp1NCoipKjHgzNRJfERrxgqKp9K
         IvdFlc7/oLjwfpL5VsqpbminAdpKlFGYq/bIQuMJIooi2G2wFBmhqiEOexD/hOYrEVmi
         7y15l85ykn1zBFqQn6oVcu8EniI1qGc5KcLszRE5wH3o8rlczkgEk3F7H/KUsqCYccJr
         BN+Q==
X-Gm-Message-State: AAQBX9fAGhKGK+Kl/fR3v06Q3M/CKwplfBghc6vQKRmmriUQ+s/0hg8/
	MDUHNeOswQric38L2i5ZZQXBkWyCOYsqFBEdMRezI00WAsBFn6yHOts=
X-Google-Smtp-Source: AKy350bA/n+0TJs+vZ+b7evX1Bg+Siykq+wmQjdVM6H/qagvAem2rH22YVMw7MOBOS5KLBYqp16PlXCOyWFFyK2R4kM=
X-Received: by 2002:a81:b612:0:b0:544:b8d8:339e with SMTP id
 u18-20020a81b612000000b00544b8d8339emr4354562ywh.5.1680719921316; Wed, 05 Apr
 2023 11:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230401185458.2280200-1-sjg@chromium.org> <20230402065454.v2.1.I2d7f563b6a82f32478a7874e36672622aebb7893@changeid>
 <d3308f32-275d-7b37-8c03-76984a2b9ddf@linaro.org>
In-Reply-To: <d3308f32-275d-7b37-8c03-76984a2b9ddf@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 6 Apr 2023 06:38:19 +1200
Message-ID: <CAPnjgZ2TNR2R+20WH_iaz0S-k8kwOSZcxFU_0_NnCfmFJo_rcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] RFC: Move Odroid-C2 to use binman to produce the image
To: neil.armstrong@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_113848_856890_3880F47E 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-amlogic@lists.infradead.org, Alper Nebi Yasak <alpernebiyasak@gmail.com>, u-boot-amlogic@groups.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 3 Apr 2023 at 19:31, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi Simon !
>
> On 01/04/2023 20:54, Simon Glass wrote:
> > This shows how binman can be used to replace the long and complicated
> > instructions with an automated build. It is still complicated to read
> > but users don't have to worry about the details.
> >
> > It needs some tidying up and only supports Odroid-C2 at present.
>
> Like the v1, the work is really nice, but the dependency on vendor binary-only
> tools doesn't make feel confident about merging this.

So long as we can download it from somewhere, that is OK, or at least
better than nothing. Is there a standard download location for the
tools?

>
> We have open source implementation for all boards, but still dependeing on
> tools we must manually build isn't optimal.
>
> What would be optimal would be to re-implement those tools into python
> libraries and merge them into the u-boot tree then use them from binman.

Or C, perhaps? Then binman can call the tools.

>
> But this could be merged as first step, them the python libaray could be
> modified to support the binary tools & a probable python re-implementation.

Yes I think it would good to get this in, even if it only supports a
few boards. It is easy to add more, when possible.

Regards,
SImon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
