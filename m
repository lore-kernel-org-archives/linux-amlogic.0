Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225C4C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 17:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C4D20679
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 17:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNbNDjby";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LZPycnek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C4D20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f3w8Ui0OmqaEK7ViN4bkQGqDS5+NdRGdta5t65z0Ic0=; b=TNbNDjbyoQFMijJlaJ5CT8ayHi
	nTjQ3KzwOqqbq1dFqC3br1X/O+ss10NyrSCtO+WaLB7J1LUtbr6dm2cAtIuxcSQmSXgDpwGJ8/x9y
	5CWnkPglR/0vzhFVp98PpNNHp2s+Qq1AihhecBO0RIpBc/EY0nId1HF4hH9j0RbrAkP0UA4oagfMO
	b05f6rEZP7tGGaTCXRRTkA41CA7ZZk8eCqeONu8tzIhN0P8z1bwCRVuAqK2L5N66zeRAzcA+d6aaM
	PJPGI3xlwwLDnYIYPXCSucM5uqs0gGvwesI+LGbfW3eFhk/UrtRlpuBCSLWhdqBbRDt8yvchF1y01
	o4t36XXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUZYk-0003ND-TO; Tue, 12 Nov 2019 17:02:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUZYi-0003Mk-9w
 for linux-amlogic@lists.infradead.org; Tue, 12 Nov 2019 17:02:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id w9so12570615wrr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2019 09:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=nEAXtzDBm38sh308ifQWQizcwae+A2CoWPbIiFYwKrk=;
 b=LZPycnekykDy+3tCiWfVwLE36sDID8Ih91KLiTQsDq2UDK0g+60HWQTUSJeQOiTlgm
 HLun017COts3Oj49wRtR7jYQnffJpNSKdCgH1t6JSFMBRdVbPo+zdxDNsjx4izyrLTou
 vR2EMSCd60AIz+fhhXUONam91Y+brzLhlRNz+KOxzohyjjZ0MX22dKVS9bS3l7reBCNv
 zamdsjIOQrRThhJKGjahl1vt2XmE4bO+I/D2k8a2N6BosYO3/oEUoYD7EkAoo8h0Z62I
 7fGRjKVZg7rERLDNxNUrJoCXfC+jBchzsk8m6TdIrsiShDBTWVpg3+7oPlF+wydkukyX
 PRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=nEAXtzDBm38sh308ifQWQizcwae+A2CoWPbIiFYwKrk=;
 b=suryVSqpdLQL0PuA276vXPib2M14J8oT/SqLSLzC1EVBWcAIkcffI5KiUQZaGtVKon
 oKGzAWXa/3wIDxkCzXZhwmTFGSg0a1zk5PAZTwcbhoZKg96yKRGpqsDohv0kksA8W3Bd
 5BLwA8L1+mkNMscKWblGIORzTLSiUY0xsq2aF0+1BvKcjHKaKKEg2VkSFPlWTjUizc4I
 PDQmSBWTFZRa/Ixy/Q8w0s2OlATr60vX8HML9VfhP5/XjqOG5Tq5hiL/zcW3w9hgQGD4
 PNuMeknxAlD6R42qQ3ZwzviGIgGbn5yxUTE//XQdSLpdecbfMhIhdwVQzlhlMthgzesY
 kKvA==
X-Gm-Message-State: APjAAAUYmZ/h2/s0EKCjLXZlgCfjOyTmw86EBTF0y+Qef1mi+VtGf2Wp
 a4cWVBpGVEXAJjl2eqc4RmBDCg==
X-Google-Smtp-Source: APXvYqyrOgNBh3quDHMJVl6ILGuxddDkKPP6rBQ+oFb7GG/5HGQ/FvsKzXhjCK/JDGuSJw+RE1Be5w==
X-Received: by 2002:adf:db41:: with SMTP id f1mr25303742wrj.351.1573578147017; 
 Tue, 12 Nov 2019 09:02:27 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p4sm23274824wrx.71.2019.11.12.09.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:02:26 -0800 (PST)
References: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
 <1ja79b4mje.fsf@starbuckisacylon.baylibre.com>
 <e80cb817-e58a-68ce-a3c6-d82636aaf7d3@amlogic.com>
 <1j8sou4u1g.fsf@starbuckisacylon.baylibre.com>
 <7ec2e682-cfec-395e-cf38-58f050440c40@amlogic.com>
 <1j7e4e4sab.fsf@starbuckisacylon.baylibre.com>
 <dee789ae-6825-3f4c-16e7-227e064562d6@amlogic.com>
 <1j5zjy4fif.fsf@starbuckisacylon.baylibre.com>
 <399e3fda-91c0-6dcb-5040-a117fe78519d@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nan Li <Nan.Li@amlogic.com>, Jianxin Pan <Jianxin.Pan@amlogic.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix mmc dma operation
In-reply-to: <399e3fda-91c0-6dcb-5040-a117fe78519d@amlogic.com>
Date: Tue, 12 Nov 2019 18:02:25 +0100
Message-ID: <1jftitf2ou.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_090228_341164_D13C0303 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 07 Nov 2019 at 04:07, Nan Li <Nan.Li@amlogic.com> wrote:

> On 2019/11/5 21:30, Jerome Brunet wrote:
>> 
>> On Tue 05 Nov 2019 at 10:05, Nan Li <Nan.Li@amlogic.com> wrote:
>> 
>> Nan Li, please fix your mailer to use plain text properly, your reply
>> are near impossible to read
>> 
> Sorry, maybe there is something wrong with my email address. Please help 
> me check whether my reply is in accordance with the format.
>

Please use plain text instead on html when replying on these mailing list.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
