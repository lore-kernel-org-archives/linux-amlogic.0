Return-Path: <SRS0=xuy8=ZC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2957C43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 00:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF84206DF
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 00:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bATfJxG1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hiJmGSln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF84206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4CBuEJPwQWH6RTnTlpvfZriZy6BfV6gNaMYLY0sVGM=; b=bATfJxG126K9rj
	vjmg4KMRPRDW21fLlvcsKMt7YycRqou2LyfekQ6cJowcEuqJ+Mynt5ZIraHaKDmlN9X9tzEWYObLW
	rP3zowqlt89ki0VgXGPhm20SN6tcbrKegtfv02t6+PB05GyKVRnMO15O3ACEZieHfwXnWQFphHlg7
	ulFha6hwSv1lwO0vvXsjTf27iE9sQzJHDvZGpPpFXATssHkZ1En3+nbB4vKuoi7ribUWFLwdDbFaX
	dpt4eFP14ij3GKEjj16RH0v/7IPJt9NpJcXFZy58hb5MaVF5rDVSmtvMQ33hE3ah90ghDdNEzb98Y
	r2TatK6nAzSifwcsSCqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTb7w-00040B-3g; Sun, 10 Nov 2019 00:30:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTb7m-0003qi-8X
 for linux-amlogic@lists.infradead.org; Sun, 10 Nov 2019 00:30:41 +0000
Received: by mail-pf1-x441.google.com with SMTP id n13so7707948pff.1
 for <linux-amlogic@lists.infradead.org>; Sat, 09 Nov 2019 16:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FxRt4BUNwVB8zpfl5d2aejL9uK6mBbXTP9pbXJEAVIA=;
 b=hiJmGSlnDpaF08YRgBaxyr5f68zjU/4xnmI2rZb2yHXrJ1OZXYRrhl8+qkrr+c1C+l
 EbOMxgoRmtBsn2DjinkASy5uaaEf4N42L3g9V6T33JIv8OsXTEb0pvk7bbZQUMjbclEW
 XxXWO9yFY8Cc0Rkr0nqGX0uMnF5CBJyvOav2c0wtaH1l3MVAV2yngr/8YpOjwN2GYOoX
 qtHMUzLYJ1DUO2kBPcErJTGREA+ykx7mVZZbuwcK2g0qOlPdimrE2jtAmteGys5e0mhe
 Ux5OkTsaK+1mLq1wmj6ricPdwe4/SfZS7Jdbbbaz2RnCccIxpR4iKPOc3NBU9/wiPycj
 M0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FxRt4BUNwVB8zpfl5d2aejL9uK6mBbXTP9pbXJEAVIA=;
 b=GAiu6ADYry6HyaKvEgjf2D/rRhGITlXLKiPmcL5Q2C2qxaaKqyqZvYErityJbYtgL8
 3FRTDsms7GKExkVby6MAa1cDsK+CB3hrdepC3pmUGmNClxFsOwW8M1xBdvgkFYHi4B3c
 7r7NUA13/esQqfV/13p2cbfQeG9cPdMF2OOmTt9/rtMg/zzpAIAX+RWvol/ShojuPv5a
 AxGlyzzPkTM8s4XfIDu1jqlCdYOnI9hThSFumThMx43VBdi0DxXppJ2VZrgL+f2U2KFC
 K55k5lVOXnYa3MDL7kgic4gJHXbaj3MRSiJpN+QFL0PtVllhl0z71zcS6bF9Abxfs2C6
 zufg==
X-Gm-Message-State: APjAAAXNPN5MT25sm1Mx1BABYSzhX6ui4Vn+KLMUJ0gJds4wKA3E99XG
 dEuQ1xIeWFNcdNB44l0dTjyung==
X-Google-Smtp-Source: APXvYqwts4OUgpJJOzYRq313xaamUKaByPW6r3ZrRxsi3tbQNzWseZBolyT2WkJLe0WrONs9SgepGA==
X-Received: by 2002:a63:6b82:: with SMTP id
 g124mr20819408pgc.178.1573345837340; 
 Sat, 09 Nov 2019 16:30:37 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:7c60:912:1380:6df8])
 by smtp.gmail.com with ESMTPSA id f19sm4460187pfk.109.2019.11.09.16.30.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 09 Nov 2019 16:30:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 2/4] firmware: meson_sm: Add secure power domain support
In-Reply-To: <1572868028-73076-3-git-send-email-jianxin.pan@amlogic.com>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-3-git-send-email-jianxin.pan@amlogic.com>
Date: Sat, 09 Nov 2019 21:11:09 +0100
Message-ID: <7hk188stcy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_163038_301318_75106967 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> The Amlogic Meson A1/C1 Secure Monitor implements calls to control power
> domain.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/firmware/meson/meson_sm.c       | 2 ++
>  include/linux/firmware/meson/meson_sm.h | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 1d5b4d7..7ec09f5 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -44,6 +44,8 @@ static const struct meson_sm_chip gxbb_chip = {
>  		CMD(SM_EFUSE_WRITE,	0x82000031),
>  		CMD(SM_EFUSE_USER_MAX,	0x82000033),
>  		CMD(SM_GET_CHIP_ID,	0x82000044),
> +		CMD(SM_PWRC_SET,	0x82000093),
> +		CMD(SM_PWRC_GET,	0x82000095),
>  		{ /* sentinel */ },
>  	},
>  };
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 6669e2a..4ed3989 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -12,6 +12,8 @@ enum {
>  	SM_EFUSE_WRITE,
>  	SM_EFUSE_USER_MAX,
>  	SM_GET_CHIP_ID,
> +	SM_PWRC_SET,
> +	SM_PWRC_GET,

These new IDs are unique to the A1/C1 family.  Maybe we should add a
prefix to better indicate that.  Maybe:

       SM_A1_PWRC_SET,
       SM_A1_PWRC_GET,

Thoughts?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
