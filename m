Return-Path: <SRS0=XO7w=55=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D2BC2BA19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2020 17:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5EFD2072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2020 17:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAbivwAd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvkMhGDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5EFD2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7qqk2yXGRf1sfoMUOEMpEZdMD1G/go11yUJk28e0ppM=; b=LAbivwAdn0JHI5LjNqGDItiI3
	QqkqvbBv7KdE6ZA9NknnoKCMiz1d7eNZYa+XN2BoAAa2PKhgPSdfrN932lxXNegAXaTcnEQbG8iaG
	9j16BfHtwIcEKd+xiOd1WsHSsk71ajNtngyqfLKxjqKNNLS33GEdo9IY4mVc2Va1uFsui54HHP2LG
	ekongCsCS4FZf1hzwac65jxPHMmE+mI5h3zPn8X8hYU4VqjgRkEItL+8VgffisWl0OA3pvdl+9cTS
	DNvnv36dP2+uoz7dfQsz8jX+wJzrZ6rMEuY+5+tMmier/gdcubFKhZCJBbLkvJ6nN0/eqtrdf95ZA
	OKd3pdXWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO2jq-0004I5-IS; Mon, 13 Apr 2020 17:19:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO2jn-0004HU-SH; Mon, 13 Apr 2020 17:19:13 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7FC22072D;
 Mon, 13 Apr 2020 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586798351;
 bh=cOHgDLG2OEFMbA+A0xqNSmIjg/9Q/4+VZgYjP32HOK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YvkMhGDzbkQJ5IvqSsLJMy9CWA6UNG4IxfMvS+UoFAsU+UEO9UNkS9b4YcZRdQ6Bk
 vhcfTLFDkgguW6HkI5Ex8GY07MxcpUl3o6V6yBIgeg8hpaLIzcNX5Mkk3yhuWrLuK+
 uZul8kU6tCSbErGxg5cODhWOZynWgcEIdPYFLRWg=
Date: Mon, 13 Apr 2020 13:19:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH AUTOSEL 5.6 11/68] media: arm64: dts: amlogic: add
 rc-videostrong-kii-pro keymap
Message-ID: <20200413171909.GP27528@sasha-vm>
References: <20200410034634.7731-1-sashal@kernel.org>
 <20200410034634.7731-11-sashal@kernel.org>
 <20200410060712.GA13759@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410060712.GA13759@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_101911_933466_C7C511F7 
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mohammad Rasim <mohammad.rasim96@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 07:07:12AM +0100, Sean Young wrote:
>On Thu, Apr 09, 2020 at 11:45:36PM -0400, Sasha Levin wrote:
>> From: Mohammad Rasim <mohammad.rasim96@gmail.com>
>>
>> [ Upstream commit 806d06161af045dba29f3c7747550c93b2ea3ca9 ]
>>
>> videostrong kii pro comes with a nec rc, add the keymap to the dts
>>
>> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Sean Young <sean@mess.org>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
>> index 2f1f829450a29..6c9cc45fb417e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
>> @@ -76,3 +76,7 @@
>>  		};
>>  	};
>>  };
>> +
>> +&ir {
>> +	linux,rc-map-name = "rc-videostrong-kii-pro";
>> +};
>
>The will need the keymap itself as well. It was added in commit
>30defecb98400575349a7d32f0526e1dc42ea83e.

I'll grab it too, thanks!

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
