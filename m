Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2E2C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 18:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 906A620737
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 18:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJBxb/XS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="hf9DrYah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 906A620737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tysuPYOyUFot1C3Ssv7ClasBjj3+k2Ih19D9SG9AGUw=; b=CJBxb/XSKORxCo
	fCVcQ9KhK7V8vKeLY9SjssfoqdvJn/xKMBSEz7D3h6rrqxNrnmScirONisPTKeMvG71WssIFkRkdk
	/C8++MvEsFPkE41/nDJc3XzntWZIx38EDlmuuKKgMhycz6BZmcLLxolnqIhSakffpe+AAVt0vcqEs
	6mflZEXJ0vDfb7DsZ0t2vrqCA2YvEqU3BrzlyhqmKN32n0i6W8utaR960qD+FtfKyTNJUwxiUWLdm
	Jtjbg11/QPYjDDVlBpfTgtdhdJnBul8ApE5nG5zVQQDyleHMhp0fr6dJr8urIC16lcvAnHcjIU64+
	qLc5ZJG9XWJZrHy8cRTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKRHE-0007tI-4P; Fri, 03 Apr 2020 18:42:48 +0000
Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKHxz-0000E3-6O
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 08:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585903527;
 bh=Vpz6XPOiR0eFsWz4pmEGbilzDuLBi/PkgsMquA3H+w0=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=hf9DrYahRNJTRCUbNMGTWJ5DZGZHDI0nDE8vCJnEVzHiaEg7vRYoCZJlQaHUwiX4Y
 DOzz1YIwQ5PTjbLBp4xla2hvNSHx6pnmwM+pU6m6crc9hUjCyzmIBtdkvNSjn3Dfmv
 U3cbVWOTSfFeQuOrAD5YhC6wApc87omT5qhkrj7I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.135.25.116]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MS290-1jmExR1xtq-00TDjC; Fri, 03
 Apr 2020 10:45:27 +0200
Subject: Re: [PATCH] crypto: amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e1916128-6554-ea57-49ef-e4ad7b0d7229@web.de>
Date: Fri, 3 Apr 2020 10:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:MSu6HIVdeTHd2XyP5jXiajKNJGqrJGBmMR9QwzjWrokVW3SDI0d
 //KW+9njLxsG7E4F+xSe3adwMVsxeP1uwoHkGaNEeBhh6oXt0Sx6BqZ51Q1pausQgQWO173
 tfsjgCHuyd8NOxY+PMzxsDWyvNQ+eaJgnteiTlvoNRI+IWF/EpFl1mVZsLAakKsfnhCzD/7
 SRfylTPckJwaILkP8SZfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jix0vBawNm8=:6RYvzk3+EjPdl28Y7TcoGf
 H68cR5Aih0J5sXr0BgkSE3zjlixchXXTsFWFSdKvZHCTLh9YdAkByHu8VI1qewhN6nw4Vtcis
 y+q/tOqXZIvY0lfjQxNRmPU2BTpMU1RsVIP7IOK9aGnaLpOlIefxwx8NtuMVAj7kG5r/W2WIl
 F7U7me4WC29CTT28jCF0/PGrOR9wYj1p76kRJmAZdbwMBMU9Jg9AL813C/gwzN9gqjp5zOMkA
 gXda9kfz3kCoCPGgwQFMHqC3WSW+uXVTqPseibl1WA+QQmFn5OFVmJdoBeiebbOFPkRTL/Y2D
 wSRDJssIn5qJrTWl7An2iiNlJfp2x93gt51x3fJ9CUK7UACbU6l730wLP+S7JbI5+rAnoAsWp
 rK2ckbmzmYOyWYT1UtCUPyP/Wi721iBF3j6ycV0bjm8oVDlCkvZUNmv+6vE4mJ6uRZvsvl3sL
 EBWAggx22c20zABttCVMrlLanQ1hDlfx9i5MiWAEpodkonQBDU5MzZUA9fd3Wfsb74ZAbCuPG
 QVYYa/2ClSM9/4nM8IVdThLKlEBMQSy0eQJyb4c9VeM12lrZV37QFYe6o27JKfcvd05CqHmpr
 1C/V1JfrUIl8a2MknwulLbIHifg3e+B1ohCJjtRBfxovIeDoPatVJaG/cB6OflFmqNpbwFVHX
 uuqDYRM596DrKwbys7jgdiKzRECtM1rEDi8iNu5nTznrMcANNcxEY1MPA4HlvoQm19FD7vwFP
 9WStSEHKjP6OIJ+SZpXniexLvyFmBAG9lXWLaEktB2++2/k9nK0HxK4Vhj38AWVBKlKyRwVc+
 tuLjjEQWYIjbVVO82nGqMlSRSAnxjjqT6PLf8njL87McIKSZfm3r28gPuddHzDXkZa8IOZ3P8
 qUjhT9moNWC0iPcukvYXQtf44nexk+FkBBqCaES+vAqVkHqW9rws89QofmVOQCkATHy7D6bPm
 0kRzK+opcWE6TgQV3KOHyInXdmhehaO8RKiIPi8Xj8aLZ1Jpv2eEwy2f9INEp905N3cZtRqJY
 sunjZPQeWkmSqdTMNdx+p6TKGdZyRKCAIMuBiTkyiXEjX9nY2+UKx2EKN2e2jwS/SAZT6b6GP
 Po9GvlcLxp3GS8h3YcV57zISO5uQOoDzILvkiwL/vMiZ3t3D10koclmJDxf+A8SjfKfOIKWUE
 A2UGNLxP9+XagfcKwgpplxHZXTu8mohH/e+FJ0xQzwn6G/dHScpYCLrJv5Z+gbgk9bhS6XAJO
 ww/1GWOfW4J/LEwfB
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_014619_536080_2C3A264E 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 03 Apr 2020 11:42:46 -0700
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBJbiB0aGlzIHBsYWNlLAoKSSBzdWdnZXN0IHRvIG9taXQgc3VjaCBhIHdvcmRpbmcgZnJvbSB0
aGUgY2hhbmdlIGRlc2NyaXB0aW9uLgoKCj4gd2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZywgcGxh
dGZvcm1fZ2V0X2lycSgpIHdpbGwKPiBwcmludCBhbiBlcnJvciBtZXNzYWdlLAoKVGhpcyBpbmZv
cm1hdGlvbiBpcyBoZWxwZnVsIGhlcmUuCgoKPiBzbyBpbiBvcmRlciB0byBhdm9pZCB0aGUgc2l0
dWF0aW9uIG9mIHJlcGVhdCBvdXRwdXTvvIwKClBvc3NpYmxlIGFkanVzdG1lbnRzOgoqIFNlcGFy
YXRlIHNlbnRlbmNlcwoKKiDigJxyZXBlYXRlZCBvdXRwdXTigJ0KCgo+IHdlIHNob3VsZCByZW1v
dmUgZGV2X2VyciBoZXJlLgoKVGh1cyByZW1vdmUgYSByZWR1bmRhbnQgZnVuY3Rpb24gY2FsbC4K
CgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGNoYW5nZSBhbnkgbW9yZSBzb3VyY2UgZmlsZXMg
aW4gYSBzeXN0ZW1hdGljIHdheT8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
