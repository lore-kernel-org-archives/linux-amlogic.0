Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46879C36000
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Mar 2025 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTeP4AefA160zj5Emj6aDbViZNqvRD+pquzYFE6651c=; b=XWJIJHnArFh7qJ
	WVBg/Lz5AX9lzw6Ud+8klEbq0VmuDm49kzl0GHTJv0VtryDHcDwT+AvkjlPGaDN/k4zlWisfrHiUJ
	n6Vdfb59NcDb4w9t5WhNkb5LbfM1Kq2o2FqBbQU1rGalAhGP1YBydohNuReK6FgX5hG/tNPP+32qx
	1P44zphlLLYLHGOHPXaB/blcyeQFJVYTB0Jz2S8zCOqTKiqXk5n63M1wjMkEWkTN785I3HEc2wVwo
	HiFVXylEXB6BU3xWgjpf8QQtHKvkDLrlmxljBNE5bU+F7ey7JdgAmBNZAj3p+0JlEyiI/Y6SAJzf/
	kh69vqBBhWZdi+cFdTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgc1-0000000FmD5-0Iod;
	Fri, 21 Mar 2025 17:56:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgZ6-0000000Flg1-1XOX
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Mar 2025 17:53:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d0782d787so16214495e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Mar 2025 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742579630; x=1743184430; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=BBGEkugGdZI7YwspPyRUqA/yjYj4mtAb3YqP6eruSxwryT2gwFbl7Nkswkyo1w7fZ9
         mVN45C4faikKbV0PVafQeNHqd397ST61zYU3YCcOjEb8rQ5Pbv6uzLS1dWa8pKHNXpH8
         wrwlAITB8o2tF0DhmjVGuPi6iM6dBbY9Fd9GC1GRMdiP8g610qmJboGdIpsrI3muByxS
         N7UcPgdB9mJJF08hbf6JRL+g+o5rfTuEk0qWS/DM08SwcCL7IoCddqDnPHipCK6AHvcS
         uaZQUjVQdycSE0l9rq6g31BXT2d+oCYfb8xRvYGGhDV0qu+oux8bkb6YAts5LJha+FeH
         u3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742579630; x=1743184430;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=RplNs7tTsGO1hafPbq/DXyfAhb9/UijaeXpyi9Cp5DuZ+uTGP10V64a/VG3TTSObPQ
         nFoWh4vhi4Ha8NpdSpzTeic4FxnA2gZU7tOnRZ+IpJLK1pWPdJ1isiqUsjOVPYgiHMij
         TD3+zu8RodYcaJha62sOOWw7i+jrH8+gMfONc2vBy6xWvvoHBbvO3/QTo8QCgJBt1PxZ
         cvG7osQ6VNXZl0KEtcPDxJmQpdcMTQI30qDYqyxEXG0hXXSLuB5VQuQjlm0TbmGm9chQ
         7X68BW8ZxCVOp9saJdSbnEnwUHlEktj1Sbqcxiv3I+IkqmODglK8G3Gcmb0E706q0YYG
         O2zg==
X-Forwarded-Encrypted: i=1; AJvYcCUHOYu/cu7HB64K6wxehOaOQR3E7tJ/hAzNFTc1Wy5NF8DOAPyPCx+ZvfrsncwuwNsOtAlukK8Dxf7gKsAE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3lOGBcpu5QuBygGQpFGf2t29Qwi53BFnEdAwmwGZlC/p8rU1W
	FnC6J2qVOl/8VP9OjZcmFJKjrpL8VOr6ANTPYoxFmvBWdIzy4g51jXC6ybMJiD8=
X-Gm-Gg: ASbGnctKl7pkDHapvChDBFaEchrXSrljXUhZfuRs2rG0RlSZL1GAs8QBVsQtm4M2FQV
	eddyy91ZIw/5stgSk7MQxfigBBvR97zhdk7etTeF+oW12Fvoke0U+8CHzvC3jHuUuYMpCbYel6Z
	UrkobDyIM9YHk4zf/6XOhblLZvw0oMrUi2xDN7knLxgSrnKVc5Cj5UFYwuEgzAzRy1XfhugUIlp
	8a9YVkMOMf8aA54V6jCBeukK8fWj1tE+ydALTWkwb59kzmIKGxYprWJenms+Zqkxy3y3QqR2e9o
	A643diPdWk77FxUgqHjwdpiGS+HEtDU7N6RquESBcbU9
X-Google-Smtp-Source: AGHT+IGw/k1s3UhG3nO2rFtVFyriyvE9zSGonoM40r54Hxa67x+rs2qU6DUJGZCT59Otrl8jKGhlwA==
X-Received: by 2002:a5d:6482:0:b0:391:2da8:6e26 with SMTP id ffacd0b85a97d-3997f94083fmr4523621f8f.52.1742579630502;
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c5a7:dfd4:9ad8:1ea0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9a31a7sm2929623f8f.23.2025.03.21.10.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 26 Feb 2025 17:01:05 -0800")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 18:53:49 +0100
Message-ID: <1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_105352_412844_6D811031 
X-CRM114-Status: GOOD (  13.20  )
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

On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:


>> +static void clk_hw_get_of_node_test(struct kunit *test)
>> +{
>> +       struct device_node *np;
>> +       struct clk_hw *hw;
>> +
>> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> +
>> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> +                                        &clk_dummy_rate_ops, 0);
>> +       of_node_put_kunit(test, np);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>
> The stuff before the expectation should likely go to the init function.
> Or it can use the genparams stuff so we can set some struct members to
> indicate if the pointer should be NULL or not and then twist through the
> code a couple times.
>

I'm trying to address all your comments but I'm starting to wonder if
this isn't going a bit too far ? The functions tested are one line
returns. Is it really worth all this ?

I do understand the idea for things that actually do something, such as
reparenting, setting rates or what not ... But this ? It feels like a
lot of test code for very little added value, don't you think ?

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
