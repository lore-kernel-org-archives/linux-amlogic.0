Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5130C76196
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uvV4JKktVE44mE5NWA6kKOEcUoWtC8vfqH/Leu6NRI=; b=HmEMuYttYilBwNKew4x1L53g9R
	HQTz1YY3I9jrjcpKuMgGILX+OIV9/t6K6+W8fOjhItc0GXdtFG+Jloc0+7uVsxJXkZDghCfuDv/3s
	Fv0dkjyvCRFtPTylZ3BAUfp9bLr5MsM/0COwdpT9OgPwUgIAnY5zIy3JzUFY0lzUR2lXqlJ/0OdG3
	dGJwWJdmdWI8roFNnJEEJlA7+EgtJ3eDKjn+Zp/ZdYzCgHlSqvGBih7S/cgemUeoUE1jB68+X7gde
	vqrVcMrRbskP8QXmswYFOm0qwm/hHnf1dtwXjMxOuj3/8lQ7ijPGx1/sjNRrMNzkocswQil9HikY5
	p9kTxbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKIY-006fIo-1Y;
	Thu, 06 Apr 2023 07:44:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKIV-006fI8-0l
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Apr 2023 07:44:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id h17so38540356wrt.8
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Apr 2023 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680767080; x=1683359080;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6745kLuVSpXwXjkp4dv1wcRzqjtE8S+hW1F6IW6ZwIo=;
        b=ZrHD5kYuZjuZG8pC+XskvMBicsqQEXSgOSiOdfKiNrVdwqQwY9JnIoqCstuD6mnxKv
         sdWqU8CgVJevfuquIesQYZDV6NWAvm5CHmnu2G8ob1iTU7q0Ua49T1lbnWotyP203jq6
         GIPAjhtKywW6t8v5BqlA4ByFr5XCYl5+S1vH04B9n5yEo465XZ1sB3mg3HaSM1udI1bH
         Sbe+jieJUi41yoja7QBAN7qCWYcFsbGQhe9qNey/A1rBWsdo3k72qlwoGAdk35eVNYDL
         H9w94Hl4v4IhYU9ciIXut0iBiy9akuDIce7mA6gXm6dobORktnqQIn9O2c+iLz3BlgMR
         D1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767080; x=1683359080;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6745kLuVSpXwXjkp4dv1wcRzqjtE8S+hW1F6IW6ZwIo=;
        b=Q/4AcpU/ptNKATRdb9Z0hBaTTgXaRNcu2gr7kq8aOeergte3NoY4M7UnB7QixWpQvH
         MJTj0egxppe686taDtKqfTqm3/niUW2B8Shk6bo/eLgYowqDyS3iIY0wS+DZqJPpL50t
         EUM+TAPa12pDZcAc0QYI8YL9a7gVNryO2BIlitRw1vawuDMDVuU4lW8H1hdzDQ/2X5UD
         bt2kMSGYvfbcjc9VVB6oa3k/qbNUatM4w2o+LPw1i1dmx8IPFfh5FS+QwH4xAXX1xMeU
         z1Gy34pyXgefx2v/j+AqUOe90XmN+yMw/lXvyZt9dahZLFquBEMRMo4CxILI2IVBZlWc
         b4Bw==
X-Gm-Message-State: AAQBX9cO8chSwDCI8UD/eArsoCeLu6RkocuPqgFPBgqrIZVP8w6h6YLx
	OJ4glT6jgn0A+JwxmBGHKqH09Q==
X-Google-Smtp-Source: AKy350bU6gImUxEQXTWdoQaahemNVMMtZpbWXS/Lww++imBisgkkKa24WsPpgztHy4WS4IEc/eitqA==
X-Received: by 2002:a5d:63c9:0:b0:2da:9606:65f7 with SMTP id c9-20020a5d63c9000000b002da960665f7mr6173038wrw.52.1680767079897;
        Thu, 06 Apr 2023 00:44:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8569:a62a:11bd:c344? ([2a01:e0a:982:cbb0:8569:a62a:11bd:c344])
        by smtp.gmail.com with ESMTPSA id t3-20020a0560001a4300b002e62384d17dsm989379wry.21.2023.04.06.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:44:39 -0700 (PDT)
Message-ID: <453b14dc-88c1-cb58-7eb7-d2d1c9cf36c9@linaro.org>
Date: Thu, 6 Apr 2023 09:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/1] RFC: Move Odroid-C2 to use binman to produce the
 image
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20230401185458.2280200-1-sjg@chromium.org>
 <20230402065454.v2.1.I2d7f563b6a82f32478a7874e36672622aebb7893@changeid>
 <d3308f32-275d-7b37-8c03-76984a2b9ddf@linaro.org>
 <CAPnjgZ2TNR2R+20WH_iaz0S-k8kwOSZcxFU_0_NnCfmFJo_rcA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAPnjgZ2TNR2R+20WH_iaz0S-k8kwOSZcxFU_0_NnCfmFJo_rcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_004443_277249_CACA87AE 
X-CRM114-Status: GOOD (  23.15  )
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
Reply-To: neil.armstrong@linaro.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-amlogic@lists.infradead.org, Alper Nebi Yasak <alpernebiyasak@gmail.com>, u-boot-amlogic@groups.io
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/04/2023 20:38, Simon Glass wrote:
> Hi Neil,
> 
> On Mon, 3 Apr 2023 at 19:31, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Hi Simon !
>>
>> On 01/04/2023 20:54, Simon Glass wrote:
>>> This shows how binman can be used to replace the long and complicated
>>> instructions with an automated build. It is still complicated to read
>>> but users don't have to worry about the details.
>>>
>>> It needs some tidying up and only supports Odroid-C2 at present.
>>
>> Like the v1, the work is really nice, but the dependency on vendor binary-only
>> tools doesn't make feel confident about merging this.
> 
> So long as we can download it from somewhere, that is OK, or at least
> better than nothing. Is there a standard download location for the
> tools?

There's no "official" location, historically the tools was shipped with the
buildroot fork in the u-boot sources, but it has been moved into different
repos now they do not ship buildroot anymore, and we can only find those tools
on the SBC vendor u-boot sources.

And the tools have the same name but only support different SoCs, there's no
versioning, licence nor documentation... so relying on those tools is a nightmare.

This is why we made a central repository with the tools + binaries for
each board with an easy script to generate the bootable binary:
https://github.com/LibreELEC/amlogic-boot-fip
and documented at:
https://u-boot.readthedocs.io/en/latest/board/amlogic/pre-generated-fip.html

> 
>>
>> We have open source implementation for all boards, but still dependeing on
>> tools we must manually build isn't optimal.
>>
>> What would be optimal would be to re-implement those tools into python
>> libraries and merge them into the u-boot tree then use them from binman.
> 
> Or C, perhaps? Then binman can call the tools.

Yes, but the open source tools aren't heavily maintained, have different ABIs...

Supporting GXBB and GXL/G12A is impossible, the binary format is totally different
for example so we should import 2 different tools.

> 
>>
>> But this could be merged as first step, them the python libaray could be
>> modified to support the binary tools & a probable python re-implementation.
> 
> Yes I think it would good to get this in, even if it only supports a
> few boards. It is easy to add more, when possible.

If this can rely on the amlogic-boot-fip repo, then why not, then we can find
a native solution to replace calling those tools.

Thanks,
Neil

> 
> Regards,
> SImon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
