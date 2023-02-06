Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3E9C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbD3Bcqdy9Ej9CiT4yhpmSZQBAsH7sIy9D/gowsbiUk=; b=mnpIkaOYyXLUgu
	nc9Ra9dIynUc5yeoc7gwUOHgw9hBgva+fHK5owkUjWfa+2RnXUL3CjK9GLXG//Xq46DzKzKTFoLRR
	/1b4Ia4GSqyAwEAI+s1ds1uSTYgWuJBHDWgWOpT8cGItIna8Waukajd3bIgG6/rIqQowXyJoQRlj5
	//tEYf/nRGpCS/Am/GGCH9FjzyFrw4gzu5dF2WVWXSs9X1WYJT5MgrtiSVe34s+J8pptSUZAXKjQY
	j9KIOAPK1h19jNhjZv5tdeBjeehapBroRhQmHLIHoQScWHcTHLU3ZCXfUtbcMrNDJMH+WV+aTWiPr
	Y8o02EcRtwnq7YyjE6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6xI-009h2a-BD; Mon, 06 Feb 2023 19:15:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6xF-009h1N-Rl
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:15:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so8182428wms.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iniev9+D6uZ6XQ9DZUsmrgSWAz/CkGjwKUBOylv7Xs8=;
        b=R8VnzjK0B/jAiGqqdhjoUnYsKIn08raxB+gye5CjA9WdNYJamW+KnOJze8NWgxUSVJ
         wZ8BbBFyCPXzjs19eYqKohofsVLZE40Dorf1tMrHzzbvgdLRVl99CnFdYUSo1n8IU4+1
         t6k+9Q4yc+EQb/cK72RgbqNcAKHI7ocHdXGKbdWDFyJRCiGN8xpIZJU0afJCUi8HQ5Lb
         nd5ilMooPqj/Grz5siAjCCuE+DTcQg2KcHmThu4HuYluOAMiYRrVO/5fBskro3g0Jeg7
         Mw1ifVgO+86CStcsYwo5MOPr5Rqdb1leO56SQbtsREyzCVwi2/pHy4RAyxueGTOd5Dws
         PAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iniev9+D6uZ6XQ9DZUsmrgSWAz/CkGjwKUBOylv7Xs8=;
        b=pG+JLbjZblDFDOa0vnNlEONNThhDhOX6ySwlg6MS9RLGNUWTP365deOOwnySWt3yA0
         9kzFJdQacHa/CNpyo9enFhu+Bau+a5IsD6WzPY6kFlOPQI/9UGsN7aW0WvGxvRDj0/ua
         FDRmSmGgo7avVaCC1OP47G68yGYR2eqCUpaA9mNkHnpo9XPF8q8EoUAF+QZU0NQdRPXY
         GrIcZofRYZGcaLAVJYpJUu8umVNP2dsXBmLhmmEGXartJx2kzubgJm1FcWyHBBUs+6C4
         6KXcSJEHn58V55J+5Otz0pafQyD9ftyNDiLm9053XKvX0j8/7hXpttXFSG32OWIikpX5
         cN7w==
X-Gm-Message-State: AO0yUKUmqyNmCJw4ZDJ6JZopp9afZms/AfwFcVpby1gyWm7Zybwq77Ws
	iv+6Kc0aOwH3fHgI3qkHHjlj1Q==
X-Google-Smtp-Source: AK7set+rmvAq7Kd2BDYlA+s7058vt+eFcngnsEXUb/HDb4/Z+Y+NjPnMTQe5zWfnu1+fv/8E3WiVjQ==
X-Received: by 2002:a05:600c:4485:b0:3e0:185:e93a with SMTP id e5-20020a05600c448500b003e00185e93amr725830wmo.25.1675710900467;
        Mon, 06 Feb 2023 11:15:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c16c400b003df245cd853sm11443197wmn.44.2023.02.06.11.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:15:00 -0800 (PST)
Message-ID: <349c949b-bcf4-e31d-b4cf-51953d0e325d@linaro.org>
Date: Mon, 6 Feb 2023 20:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] ASoC: dt-bindings: meson: convert axg fifo to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-5-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-5-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111505_929584_6A9973A6 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 112 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
