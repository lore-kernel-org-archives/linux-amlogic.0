Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB72BCEF161
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Zu/+2BtPpUnqTilJWlnu8ACq0c3rn8X/h6NrvVxr4E=; b=bwDKDhZsbNnOBt
	Hg94TbOOFcA7Zw62yzqUkfHcwKItw3bWmyaTaKLUgjrmGSqleg2N8gWD745iR5wSSCWeeVD4uLtSS
	yMFHUfIKxZCDAhY74HjUMmDdDb2Z7gJvG8bWhbLVwqMjz0RpeyDD60I66c2rbWeJWvNdpuXwcZJV4
	lJozgnhTeyc4kRTy1XbEsniGp1rJYAb7OrCq+Rqo9mZ300SMsS8faZUm2IgkGD01R3sZa/bh99e2y
	a+VptuSagbCF1m0VaizZTNKf27TxdqVNo44cg8xSyo2Ukao3i4SbaW5M6uN2n27JiOgcmJftYQXkg
	LPu9z8L7o3xaWqjDouhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9US-00000005qPH-0ZCk;
	Tue, 08 Oct 2024 12:39:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9TV-00000005qFl-0ZOv
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 12:38:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37cd8972738so3851471f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728391078; x=1728995878; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=by4sWSBDpCIFjcZGzg4X08UIZKTUMpJ+pa0NCXVeqdU=;
        b=PFtr455lOnzdNjqDkfJ1G7MxXN42bI458hujn6wPSSRFvsbT0KI7yDR5LpmawSy5FQ
         rSmLbH1bq4bweQiyIf/+PE0VVJUmVgN4RjYcAlb5K4Rz7l1Kv8o7ikZwXLNWzb5WRoEm
         AJUVZyi3ujAD1KwTxrYJrP7whhmJw4ajMaF3BHXHg82ord/LzRIpgQECrSgaNbFMhE6S
         JAlTFdVXnyeCX/UgjPfWRljJqtiq4duCEB73HJD52B9AvfPD6tjBVKxch2Gm0xaDEto6
         W4Dr3ui5aRLqe3zyrzaQeMAdnT1ftWtpSgWvQrnRk0PSEzvLJMdslSFfVbNTnjtpAq5T
         MYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391078; x=1728995878;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=by4sWSBDpCIFjcZGzg4X08UIZKTUMpJ+pa0NCXVeqdU=;
        b=eembDcAU5iBEuDmE2NZF50oqHoNSFwrqqHHPh3ZGL7sTtLeRza94DL/kYeUDVIKitj
         brTgFOmPXUS2kIlJSk00adTCRVcKeQK9ABKKdSOP9BJ0X+M6yX8q3vA85MYb3TV0MNtG
         I5y8FkL+rA1ifU3lAoaLfsTYLs76dh2Foanxf/l8xO6uEot+GQ6ihQIcXw97z59KUBNH
         fxzl/BS+mA3fYaC2x6owaSo91MzmSmMUpYo+H8W7gAmCfg7ToWgmo4+iinEd/1NMcDct
         9hCYyljZZFbLbztc7MkaxvxC5edwaCDCjjIYnlkKf33fdFpk19DZwOdSGyL+IrozuJ7d
         H2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXY/KJfaPFL9+QPgD3gBai2Kpu4oyRHHh27yL29iOhphCIEXazNp6kKAUGQenXkTKUlFSyRPrkbbrwU8LSe@lists.infradead.org
X-Gm-Message-State: AOJu0YyoWJGuA2yUOkBaBTkQ5xF0DYKp0G6TQ2Bpvb6bDmqN8tUHl/jP
	qqogtS9uplxtb09QdH7n/wkesaxoVqtv1G3dGj8B+bUH3b4uy7N1Bb3MqzBkR5w=
X-Google-Smtp-Source: AGHT+IF7jLyp1F9r1R7paqLXL7lZm4mJSG2e31oTisk0Sxja0KjHZpxs+MoHEKQXr+fL0PGmbZlONQ==
X-Received: by 2002:a5d:5e0b:0:b0:37c:d244:bdb1 with SMTP id ffacd0b85a97d-37d11311be4mr7478306f8f.26.1728391078001;
        Tue, 08 Oct 2024 05:37:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:41f2:4244:ce34:c273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43050578facsm20299775e9.19.2024.10.08.05.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:37:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Cc: George Stark <gnstark@salutedevices.com>,
  u.kleine-koenig@pengutronix.de,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  linux-pwm@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel@salutedevices.com
Subject: Re: [PATCH 3/3] pwm: meson: Enable constant and polarity features
 for g12, axg, s4
In-Reply-To: <5c3a6fdb-e4f0-4a22-9a8d-84baee12769c@linaro.org> (neil
	armstrong's message of "Tue, 8 Oct 2024 09:31:09 +0200")
References: <20241007193203.1753326-1-gnstark@salutedevices.com>
	<20241007193203.1753326-4-gnstark@salutedevices.com>
	<5c3a6fdb-e4f0-4a22-9a8d-84baee12769c@linaro.org>
Date: Tue, 08 Oct 2024 14:37:56 +0200
Message-ID: <1ja5fesrbv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_053801_346439_82159956 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue 08 Oct 2024 at 09:31, neil.armstrong@linaro.org wrote:

> On 07/10/2024 21:32, George Stark wrote:
>> g12, axg and s4 SoC families support constant and polarity bits so enable
>> those features in corresponding chip data structs.
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   drivers/pwm/pwm-meson.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 6701738c55e3..c6f032bdfe78 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -571,26 +571,36 @@ static const struct meson_pwm_data pwm_gxbb_ao_data = {
>>   static const struct meson_pwm_data pwm_axg_ee_data = {
>>   	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct meson_pwm_data pwm_axg_ao_data = {
>>   	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct meson_pwm_data pwm_g12a_ee_data = {
>>   	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
>>   	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>>   	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
>>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct meson_pwm_data pwm_meson8_v2_data = {

This needs to be splitted and adjusted as well then.
g12 and axg are covered by pwm_meson8_v2_data.

>> @@ -599,6 +609,8 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>>     static const struct meson_pwm_data pwm_s4_data = {
>>   	.channels_init = meson_pwm_init_channels_s4,
>> +	.has_constant = true,
>> +	.has_polarity = true,
>>   };
>>     static const struct of_device_id meson_pwm_matches[] = {
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
