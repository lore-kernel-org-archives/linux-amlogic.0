Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B81EC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 May 2022 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:To:From:MIME-Version
	:Date:Message-ID:Content-Type:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmVJv5VnN65CyvXt4i7Lbr2SmEwOARJd7MPruV0qDcs=; b=WjvtOWhKmUbZ4SVvYgF1aVsieF
	TZSku63mSXhcJ7FgQxhYqAnRyv/PBeRh5T9WpyWA0dBGReRTYv0ac1NgGzvsDBpvE6R9gBJdFELrX
	ggsYSYYVdsjMOMBW/X2D33iDRPB5G1MGGHZxwLmsv8DYUeI9EUwoWOz2uOxUAoTMzOm9bnFnK3/n8
	UZfnmmvwSCQcWPXbIQj+mfDRdsIRswGSQO7u2rSzvFbFj6U2VS/i29o76KNVoBCu0t+xkQUHoQn4E
	4YqDjZYMsZM6+OuC0GTiuLqOj4PXGr870ApHfVmENvrGBZQHtUIGB+GWDqSCKNkRHwtz/a5vbttM/
	0I6O4GPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqHSR-004Th0-72; Sun, 15 May 2022 16:51:03 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqHSO-004TgJ-8W
 for linux-amlogic@lists.infradead.org; Sun, 15 May 2022 16:51:01 +0000
Received: by mail-qv1-xf30.google.com with SMTP id j3so1292327qvn.0
 for <linux-amlogic@lists.infradead.org>; Sun, 15 May 2022 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from:to
 :subject; bh=9XzF0YKxaH9KgRywN3lCE0kRZ3QPZxCUJtm63wuBwhc=;
 b=pRFd4TP7Ca7zKc5MWXxoUufH9c03aksN42QXdDhaxxXHnHkGs7ulNJzkg8SDEkwMHy
 +ZRd/HyD65lVV4ihHOjwE0PiK/I094HU0kqL+H3BLV9Ck1l+sIp/4twW3sJ7tii/fa9E
 hI9dJXaFzawtAo6gcdsr8154rqvVAatyiknPT7OYHOSotB+DymHNZnLrfdcawQpk2ua+
 5Z7iYD3kkdV3TusfWLOWzcqqqaD+JkUy/MIAALiAZwSqzgMH9ivWMAdfzeQ/Da6CsNvS
 MkJYGX5f32wL0Ixwfl+3cziNccNpcnHk/to8QLnpjREZRUtq1fJrLcRQ4D+XeXV4PYcx
 p59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:subject;
 bh=9XzF0YKxaH9KgRywN3lCE0kRZ3QPZxCUJtm63wuBwhc=;
 b=GUnIwpRw8ILsVAw8VN5dkci4wnW4bhHcwgqBq/9lNBApDUtaM5G6OSVibeXJDT9k+C
 +JMY2CC8CGtf6DChrcJOBuhsRcyn4skz/EB2JdcaJI+kFif9E2wC0HTafkvoQo+EiUmA
 k2ZgGk277rdkWV+ACEx8egNt7Xy/xLY3fSdUAn7pm0WB/47bxT0ZPfWQymha2fAwbaMB
 qP0HH2ABFJAEF64TgjgOmiWA8L19A1prkUz51ddAE/yfTVzuXTsdIy8NoquF1yfCrz6S
 npD0EeMhjUH5qoLsLuRa91O1JreuHQwIgdRN8ERgsXweXX0ntX7x21ysTrYlac6E8Wto
 YMcg==
X-Gm-Message-State: AOAM532a/QyJannJ1695/P72TKm7YMrF+MZW6TllwUnu/ognwR+utm/3
 3RqjIyT9hQjfLnXtv4dwv30aY3q6x63eDQ==
X-Google-Smtp-Source: ABdhPJyAe978xobd4aMbTFmZdE3JG82zK28NMP9VXz1tbG7fekQGhQocBJKMErfz83JJSb8c+dDHXQ==
X-Received: by 2002:a05:6214:250b:b0:45b:9ee:730a with SMTP id
 gf11-20020a056214250b00b0045b09ee730amr12227319qvb.15.1652633458668; 
 Sun, 15 May 2022 09:50:58 -0700 (PDT)
Received: from [192.168.1.134] ([24.139.179.16])
 by smtp.gmail.com with ESMTPSA id
 p18-20020ac87412000000b002f3d23cf87esm4793936qtq.27.2022.05.15.09.50.25
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 May 2022 09:50:58 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------gmt01UGoK1KuCL4Pt8Gv8shZ"
Message-ID: <ff473c04-ffac-fdbc-597b-e0bce7e3d6fd@gmail.com>
Date: Sun, 15 May 2022 12:50:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Jefferson Gonzalez <jgmdev@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: OdroidN2/N2+ HDMI Green Line
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_095100_344051_F02E5CE6 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Writing to report an old issue about a green line on the left side of the
screen with some files hoping that it helps troubleshoot the cause. The 
issue
happens when connecting the HDMI cable directly to the hdmi input port 
of the
display, when using an HDMI to VGA converter and connecting it to the 
display
VGA input port the issue doesn't happen.

In this message I attach the output of "cat 
/sys/kernel/debug/dri/*/state" for
both hdmi and vga, also both edid files when connected to hdmi and vga. The
files were retrieved using kernel 5.18rc4 and happens on mainline uboot,
the tow-boot distribution or upstream uboot.
--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: text/plain; charset=UTF-8; name="hdmi_dri_state.txt"
Content-Disposition: attachment; filename="hdmi_dri_state.txt"
Content-Transfer-Encoding: base64

cGxhbmVbMzRdOiBtZXNvbl9wcmltYXJ5X3BsYW5lCgljcnRjPW1lc29uX2NydGMKCWZiPTQz
CgkJYWxsb2NhdGVkIGJ5ID0gd2F5ZmlyZQoJCXJlZmNvdW50PTIKCQlmb3JtYXQ9QVIyNCBs
aXR0bGUtZW5kaWFuICgweDM0MzI1MjQxKQoJCW1vZGlmaWVyPTB4MAoJCXNpemU9MTYwMHg5
MDAKCQlsYXllcnM6CgkJCXNpemVbMF09MTYwMHg5MDAKCQkJcGl0Y2hbMF09NjQwMAoJCQlv
ZmZzZXRbMF09MAoJCQlvYmpbMF06CgkJCQluYW1lPTAKCQkJCXJlZmNvdW50PTMKCQkJCXN0
YXJ0PTAwMTAwYWZlCgkJCQlzaXplPTU3NjMwNzIKCQkJCWltcG9ydGVkPW5vCgkJCQlwYWRk
cj0weDAwMDAwMDAwZTVmMDAwMDAKCQkJCXZhZGRyPTAwMDAwMDAwMzUzODhmYTgKCWNydGMt
cG9zPTE2MDB4OTAwKzArMAoJc3JjLXBvcz0xNjAwLjAwMDAwMHg5MDAuMDAwMDAwKzAuMDAw
MDAwKzAuMDAwMDAwCglyb3RhdGlvbj0xCglub3JtYWxpemVkLXpwb3M9MQoJY29sb3ItZW5j
b2Rpbmc9SVRVLVIgQlQuNjAxIFlDYkNyCgljb2xvci1yYW5nZT1ZQ2JDciBsaW1pdGVkIHJh
bmdlCnBsYW5lWzM3XTogbWVzb25fb3ZlcmxheV9wbGFuZQoJY3J0Yz0obnVsbCkKCWZiPTAK
CWNydGMtcG9zPTB4MCswKzAKCXNyYy1wb3M9MC4wMDAwMDB4MC4wMDAwMDArMC4wMDAwMDAr
MC4wMDAwMDAKCXJvdGF0aW9uPTEKCW5vcm1hbGl6ZWQtenBvcz0wCgljb2xvci1lbmNvZGlu
Zz1JVFUtUiBCVC42MDEgWUNiQ3IKCWNvbG9yLXJhbmdlPVlDYkNyIGxpbWl0ZWQgcmFuZ2UK
Y3J0Y1s0MF06IG1lc29uX2NydGMKCWVuYWJsZT0xCglhY3RpdmU9MQoJc2VsZl9yZWZyZXNo
X2FjdGl2ZT0wCglwbGFuZXNfY2hhbmdlZD0xCgltb2RlX2NoYW5nZWQ9MAoJYWN0aXZlX2No
YW5nZWQ9MAoJY29ubmVjdG9yc19jaGFuZ2VkPTAKCWNvbG9yX21nbXRfY2hhbmdlZD0wCglw
bGFuZV9tYXNrPTEKCWNvbm5lY3Rvcl9tYXNrPTEKCWVuY29kZXJfbWFzaz0xCgltb2RlOiAi
MTYwMHg5MDAiOiA2MCAxMDgwMDAgMTYwMCAxNjI0IDE3MDQgMTgwMCA5MDAgOTAxIDkwNCAx
MDAwIDB4NjAgMHg1CmNvbm5lY3RvclszMl06IEhETUktQS0xCgljcnRjPW1lc29uX2NydGMK
CXNlbGZfcmVmcmVzaF9hd2FyZT0wCg==
--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: text/plain; charset=UTF-8; name="vga_dri_state.txt"
Content-Disposition: attachment; filename="vga_dri_state.txt"
Content-Transfer-Encoding: base64

cGxhbmVbMzRdOiBtZXNvbl9wcmltYXJ5X3BsYW5lCgljcnRjPW1lc29uX2NydGMKCWZiPTQy
CgkJYWxsb2NhdGVkIGJ5ID0gd2F5ZmlyZQoJCXJlZmNvdW50PTIKCQlmb3JtYXQ9QVIyNCBs
aXR0bGUtZW5kaWFuICgweDM0MzI1MjQxKQoJCW1vZGlmaWVyPTB4MAoJCXNpemU9MTYwMHg5
MDAKCQlsYXllcnM6CgkJCXNpemVbMF09MTYwMHg5MDAKCQkJcGl0Y2hbMF09NjQwMAoJCQlv
ZmZzZXRbMF09MAoJCQlvYmpbMF06CgkJCQluYW1lPTAKCQkJCXJlZmNvdW50PTMKCQkJCXN0
YXJ0PTAwMTAwNTdmCgkJCQlzaXplPTU3NjMwNzIKCQkJCWltcG9ydGVkPW5vCgkJCQlwYWRk
cj0weDAwMDAwMDAwZTU5MDAwMDAKCQkJCXZhZGRyPTAwMDAwMDAwM2ZhMGJhNzQKCWNydGMt
cG9zPTE2MDB4OTAwKzArMAoJc3JjLXBvcz0xNjAwLjAwMDAwMHg5MDAuMDAwMDAwKzAuMDAw
MDAwKzAuMDAwMDAwCglyb3RhdGlvbj0xCglub3JtYWxpemVkLXpwb3M9MQoJY29sb3ItZW5j
b2Rpbmc9SVRVLVIgQlQuNjAxIFlDYkNyCgljb2xvci1yYW5nZT1ZQ2JDciBsaW1pdGVkIHJh
bmdlCnBsYW5lWzM3XTogbWVzb25fb3ZlcmxheV9wbGFuZQoJY3J0Yz0obnVsbCkKCWZiPTAK
CWNydGMtcG9zPTB4MCswKzAKCXNyYy1wb3M9MC4wMDAwMDB4MC4wMDAwMDArMC4wMDAwMDAr
MC4wMDAwMDAKCXJvdGF0aW9uPTEKCW5vcm1hbGl6ZWQtenBvcz0wCgljb2xvci1lbmNvZGlu
Zz1JVFUtUiBCVC42MDEgWUNiQ3IKCWNvbG9yLXJhbmdlPVlDYkNyIGxpbWl0ZWQgcmFuZ2UK
Y3J0Y1s0MF06IG1lc29uX2NydGMKCWVuYWJsZT0xCglhY3RpdmU9MQoJc2VsZl9yZWZyZXNo
X2FjdGl2ZT0wCglwbGFuZXNfY2hhbmdlZD0xCgltb2RlX2NoYW5nZWQ9MAoJYWN0aXZlX2No
YW5nZWQ9MAoJY29ubmVjdG9yc19jaGFuZ2VkPTAKCWNvbG9yX21nbXRfY2hhbmdlZD0wCglw
bGFuZV9tYXNrPTEKCWNvbm5lY3Rvcl9tYXNrPTEKCWVuY29kZXJfbWFzaz0xCgltb2RlOiAi
MTYwMHg5MDAiOiA2MCAxMDgwMDAgMTYwMCAxNjI0IDE3MDQgMTgwMCA5MDAgOTAxIDkwNCAx
MDAwIDB4NjAgMHg1CmNvbm5lY3RvclszMl06IEhETUktQS0xCgljcnRjPW1lc29uX2NydGMK
CXNlbGZfcmVmcmVzaF9hd2FyZT0wCg==
--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: application/octet-stream; name="hdmi_edid"
Content-Disposition: attachment; filename="hdmi_edid"
Content-Transfer-Encoding: base64

AP///////wBMLUMLQTUzMA0ZAQOANR54Kp/1pVVQniYQUFS/74BxT4HAgQCBgJUAqcCzAAEB
AjqAGHE4LUBYLEUAEyshAAAeAR0AclHQHiBuKFUAEyshAAAeAAAA/QAySx5REQAKICAgICAg
AAAA/ABTMjREMzAwCiAgICAgAYsCAxGxRpAEHxMDEmUDDAAQAAEdALxS0B4guChVQBMrIQAA
HowK0JAgQDEgDEBVABMrIQAAGIwK0Iog4C0QED6WABMrIQAAGAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIQ==
--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: application/octet-stream; name="vga_edid"
Content-Disposition: attachment; filename="vga_edid"
Content-Transfer-Encoding: base64

AP///////wBMLUILQTUzMA0ZAQOANR54Kp/xpVVQniYQUFS/74BxT4HAgQCBgJUAqcCzAAEB
AjqAGHE4LUBYLEUAEyshAAAeAAAA/QA4Sx5REQAKICAgICAgAAAA/ABTMjREMzAwCiAgICAg
AAAA/wBIQ0tHMzAwNDI1CiAgAU0CAxthIwkHB4MBAABnAwwAIACALUOQhALiAA+MCtCKIOAt
EBA+lgCgWgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKQ==

--------------gmt01UGoK1KuCL4Pt8Gv8shZ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--------------gmt01UGoK1KuCL4Pt8Gv8shZ--

