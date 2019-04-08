Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E667C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC1220883
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 09:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kx6/xKV0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="ELMWO/KM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC1220883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlP7Jrzukbxq+jSO1aVZvOA8RdGVU+pxhPSahMnSrtI=; b=kx6/xKV0mHzMPH
	diJxrm4E1UKiHDZgh6I/D40lHTq9rbQU8qlMELgf/d96bbCT+MnbjpiC0PtBnwMtDKSOIqkubUaja
	8UKod1KR6PqcZX7q03ED87RjbDZ6U+pA4TBj7sbZ6sW6KP7rgez4/TwkWX5/flZ7DS3mBMcvln+/w
	O0JCd5fzeIG8ftcvHDAdDw9QVZ5JnjLEkU5IFWBApUJ7cgSNOIqa0Uzoryfye0S8f80WavsX8XiXv
	gHSDXiAqH5ikKKj97JSeWntoRSbCP1NLRf//N8FMqwlefMd87HV0YqQ+p05nXZ+eZe9nXy2TTbHzx
	YtkQISq489zX+rv09tHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDQLE-0003KB-VY; Mon, 08 Apr 2019 09:13:24 +0000
Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDQL4-000394-0K; Mon, 08 Apr 2019 09:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1554714786;
 bh=sUwzrD7RZuTDwuXZNC+f8mmMbFOnqzcSuIsH5KOjO38=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ELMWO/KMzimqI7jTAaaT4o+87XXcxdVAXnl61hn5RsbfV6uVuMpH4O0FPvokRnanE
 mA+Ya1GV+LhbM0FJpUR8tANelNTyoV5q6OXJNwyxfyewQ7aUASH8Sfwxbapdk4xdcC
 2IL/ED1KDc5VkilZ9j4YnGUgN+Kxj6s4rd2snw3A=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.184.114]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LwqFo-1gpSOo3544-016Mgd; Mon, 08
 Apr 2019 11:13:06 +0200
Subject: Re: [PATCH v2] drm/meson: fix possible object reference leak
To: Wen Yang <wen.yang99@zte.com.cn>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1554692313-28882-1-git-send-email-wen.yang99@zte.com.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <50c3039d-ff5a-2136-863d-fcecce5bdc7f@web.de>
Date: Mon, 8 Apr 2019 11:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554692313-28882-1-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-US
X-Provags-ID: V03:K1:8TgCJjTHZ1CL0wHUt4lh/P2bJ9UTOGjrdJO6GHN0M8bB+gBwO28
 A7KzOzOUoJtSZRK9ENGMQ6xesqexX4pMLga/0lSid2UWYknWq0s4tKrifc/UKn/LP0KkkUs
 2e61dr1+jxWsAMP8A5tvGlPpXOr7jjPNStqfFLSWlQxNP33Q8Wtv2WTY0yrTv+gF/twJPAW
 4WhT6lB+cqD8G0XOwYNhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iKhVYz+Ugzc=:NOmOqiT7mDSf8hTiEsjLW1
 Ho/4y7WRQFGfH5sbPtoIt8fOZkbg+PFN6RsxKKcEdthLgVNYRwYzFV25ZQb7mM+Z48Hi9bqIg
 igDXz8F2oWGk8BXUz2bGI8ADnY826SnweLfL7/a+yV/9uRIP0L4AKiOPnGtUMEl3nfXP0p8rC
 6PwqVirecaK8wlpKnhEF4ON+SDUUtLIbwhL1/dolKZOFTavpFR4Kk46zmEIgeU9rDNJnvjF0Z
 dEOwOG0U5rVbtlyfsPd78C4eVLfjMY3HJ3k9tEI38dud8ksI+UiN1RDV8zQaKsyT+Fhn7bogY
 IgHV6yI6fMdlKZ66olSI9aliw99hp+2GYSZgbZhzg4J2q1WWaVC3g7/z5wqpYk4j+IHl1mkUe
 BZ9RcmrNUjIO+Zrqnuv0fiPsAnqlnxAzfJqCwY+2l1wi2gQCOYh42jv9ZlHzDHIKGFLKLU//p
 VQBKyGUI9odH5JhqNximOxgzgzkPWFNHGxOfam/DvWK+mUCZo3WXpYlbvtMElPIiehzpY89ur
 RDE11OkF8WPcoumeWY8VhbfcGpxHXk/sL3fsM71bsJMpfyIttI6vAN1Ca6uyTA1EcSkZL2d+8
 uSjrZ/RaoNb5tEOewACEWuYkdC7zvopRRXDqnpr+wuQvr32deEjZu9pQ2/fwQEfbP1Shx0GTo
 vV51BbLQesP4UDI9YKfJUFQKgWMqqIoipRoRvRho83rEL3K6rAUlwNrPymo56Pd0KHgWOmKxu
 QnULJzIxOsN0juorx4ZdbSyh4CbmVRMuB0gS4FXdZG/D32SiGGcDf8VOon1CYvf0sOYTaOtHN
 nmn3nYWr3ARIX52Lyvi0a2mldu5NrRTZ+yuoHJ954CXR9V8WPchr9bzY7VBWatszJ08feoscL
 qqiKaBy9UCD5BA8gwcJcU6DdzN4y9aawaP8Chcy7ZpjZ48OBlG0iRfyaUuvapXWkEvJkZaaU6
 6HLi0J+MdIw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_021314_396210_553EAF3F 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> v2->v1: convert a if statement into a ternary statement.

Would you like to omit the arrow in such version information?


> @@ -720,15 +720,10 @@ static bool meson_hdmi_connector_is_available(struct device *dev)
>
>  	/* If the endpoint node exists, consider it enabled */
>  	remote = of_graph_get_remote_port(ep);
> -	if (remote) {
> -		of_node_put(ep);
> -		return true;
> -	}
> -
>  	of_node_put(ep);
>  	of_node_put(remote);

Can a reordering of the passed variables be useful for such function calls?

+  	of_node_put(remote);
+  	of_node_put(ep);

Regards,
Markus

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
